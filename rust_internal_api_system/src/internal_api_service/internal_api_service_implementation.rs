use std::sync::{Arc, Mutex};

use tonic::{transport::Server, Request, Response, Status};

pub mod grpc_internal_api_service {
    tonic::include_proto!("internal_api_service"); //This is the package name?
}

// use grpc_internal_api_service::internal_api_service_server::{InternalApiService, InternalApiServiceServer};
// use grpc_internal_api_service::{
//     CreateAUserRequest, CreateAUserResponse, DeleteAUserRequest, DeleteAUserResponse
// };

use crate::internal_api_service::postgre_sql_database_handler::PostgreSqlDatabaseHandler;
use crate::EnvironmentVariables;

// #[derive(Debug, Default)]
#[derive(Debug)]
pub struct MyInternalApiService {
    postgre_sql_database_handler: PostgreSqlDatabaseHandler,
    //use Arc<Mutex<T>> to share variables across threads
}

#[tonic::async_trait]
impl grpc_internal_api_service::internal_api_service_server::InternalApiService for MyInternalApiService {
    async fn create_a_user(
        &self,
        request: Request<grpc_internal_api_service::CreateAUserRequest>,
    ) -> Result<Response<grpc_internal_api_service::CreateAUserResponse>, Status> {
        println!("Got a request: {:?}", request);

        let email = request.get_ref().clone().email;
        let email_in_header = request.metadata().get("user_email");
        if (email_in_header != None) && (email_in_header.unwrap().to_str().unwrap().to_string() == email) {
            println!("Got a user email from header: {:?}", email_in_header.unwrap().to_str().unwrap().to_string());
            println!("The email from input == to the email from header !!!");
        };

        let reply = grpc_internal_api_service::CreateAUserResponse {
            result: format!("Hello {}!", email).into(),
            error: None,
        };

        self.postgre_sql_database_handler.say_hi(email).await;

        Ok(Response::new(reply))
    }

    async fn delete_a_user(
        &self,
        request: tonic::Request<grpc_internal_api_service::DeleteAUserRequest>,
    ) -> Result<tonic::Response<grpc_internal_api_service::DeleteAUserResponse>, tonic::Status> {
        let reply = grpc_internal_api_service::DeleteAUserResponse {
            result: format!("Hello {}!", request.into_inner().email).into(),
            error: None,
        };

        Ok(Response::new(reply))
    }
}

pub async fn run(
    environment_variables: EnvironmentVariables,
    grpc_host: String,
    grpc_port: String,
) -> Result<(), Box<dyn std::error::Error>> {
    let address_string = format!("{host}:{port}", host = grpc_host, port = grpc_port);
    let addr = address_string.parse()?;

    let python_account_structure = PostgreSqlDatabaseHandler {
        postgre_sql_address: Arc::new(Mutex::new(
            environment_variables.postgre_db_network_name,
        ))
        .clone(),
    };
    let my_account_service = MyInternalApiService {
        postgre_sql_database_handler: python_account_structure,
    };

    let svc = 
        grpc_internal_api_service::internal_api_service_server::InternalApiServiceServer
        ::new(my_account_service);

    println!("Internal API Server is running on http://{} ...", address_string);

    Server::builder().add_service(svc).serve(addr).await?;

    Ok(())
}
