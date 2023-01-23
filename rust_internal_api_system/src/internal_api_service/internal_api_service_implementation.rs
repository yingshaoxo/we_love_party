use std::sync::{Arc, Mutex};

use futures::TryStreamExt;
use futures::pin_mut;
// use tokio_postgres::types::FromSql;
// use tokio_postgres::types::ToSql;
// use tokio_postgres::{Client, Connection, Socket};
use tonic::{transport::Server, Request, Response, Status};

pub mod grpc_internal_api_service {
    tonic::include_proto!("internal_api_service"); //This is the package name?
}

// use grpc_internal_api_service::internal_api_service_server::{InternalApiService, InternalApiServiceServer};
// use grpc_internal_api_service::{
//     CreateAUserRequest, CreateAUserResponse, DeleteAUserRequest, DeleteAUserResponse
// };

use crate::{internal_api_service::postgre_sql_database_handler::PostgreSqlDatabaseHandler, environment_module::basic::EnvironmentVariables};
// use crate::EnvironmentVariables;
use crate::grpc_key_string_maps::data_model;

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
        // let email_in_header = request.metadata().get("user_email");
        // if (email_in_header != None) && (email_in_header.unwrap().to_str().unwrap().to_string() == email) {
        //     println!("Got a user email from header: {:?}", email_in_header.unwrap().to_str().unwrap().to_string());
        //     println!("The email from input == to the email from header !!!");
        // };

        let reply = grpc_internal_api_service::CreateAUserResponse {
            result: format!("Hello {}!", email).into(),
            error: None,
        };

        Ok(Response::new(reply))
    }

    async fn delete_a_user(
        &self,
        request: tonic::Request<grpc_internal_api_service::DeleteAUserRequest>,
    ) -> Result<tonic::Response<grpc_internal_api_service::DeleteAUserResponse>, tonic::Status> {
        let email = request.get_ref().clone().email;

        let reply = grpc_internal_api_service::DeleteAUserResponse {
            result: format!("Hello {}!", email).into(),
            error: None,
        };

        Ok(Response::new(reply))
    }

    async fn check_if_user_exists(
        &self,
        request: tonic::Request<grpc_internal_api_service::CheckIfUserExistsRequest>,
    ) -> Result<tonic::Response<grpc_internal_api_service::CheckIfUserExistsResponse>, tonic::Status> {
        let email = request.get_ref().clone().email;
        let mut default_reply = grpc_internal_api_service::CheckIfUserExistsResponse {
            user_exists: false,
            error: Some("Unknonw error".to_string()),
        };

        let client = self.postgre_sql_database_handler.get_postgre_sql_client().await.unwrap();
        let rows = client
        .query(
            r#"SELECT (email) FROM "user" WHERE email = $1;"#, 
            &[
                &email
            ]
        )
        .await.unwrap();
        if rows.len() == 0 {
            default_reply.user_exists = false;
            default_reply.error = None;
            return Ok(Response::new(default_reply));
        }

        default_reply.error = None;
        default_reply.user_exists = true;

        return Ok(Response::new(default_reply));
    }

    async fn get_user(
        &self,
        request: tonic::Request<grpc_internal_api_service::GetUserRequest>,
    ) -> Result<tonic::Response<grpc_internal_api_service::GetUserResponse>, tonic::Status> {
        let email = request.get_ref().clone().email;
        let mut default_reply = grpc_internal_api_service::GetUserResponse {
            user_exists: false,
            email: "".to_string(),
            username: Some("".to_string()),
            head_image: Some("".to_string()),
            sex: Some(1),
            age: Some(24),
            error: Some("Unknonw error".to_string()),
        };

        let client = self.postgre_sql_database_handler.get_postgre_sql_client().await.unwrap();
        let rows = client
        .query(
            r#"SELECT * FROM "user" WHERE email = $1;"#, 
            &[
                &email
            ]
        )
        .await.unwrap();
        if rows.len() == 0 {
            default_reply.user_exists = false;
            default_reply.error = None;
            return Ok(Response::new(default_reply));
        }

        default_reply.error = None;
        default_reply.user_exists = true;
        default_reply.email = rows[0].get::<_, &str>(data_model::User::email).to_string();
        default_reply.username = Some(rows[0].get::<_, &str>(data_model::User::username).to_string());
        default_reply.sex = Some(rows[0].get::<&str, i32>(data_model::User::sex));
        default_reply.age = Some(rows[0].get::<&str, i32>(data_model::User::age));
        default_reply.head_image = Some(rows[0].get::<_, &str>(data_model::User::head_image).to_string());

        return Ok(Response::new(default_reply));
    }
}

pub async fn run(
    environment_variables: EnvironmentVariables,
    grpc_host: String,
    grpc_port: String,
) -> Result<(), Box<dyn std::error::Error>> {
    let python_account_structure = PostgreSqlDatabaseHandler {
        environment_variables: environment_variables.clone(),
    };

    let address_string = format!("{host}:{port}", host = grpc_host, port = grpc_port);
    let addr = address_string.parse()?;

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
