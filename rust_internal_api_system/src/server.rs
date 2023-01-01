#![allow(dead_code)]
#![allow(unused_variables)]
use std::env;

#[derive(Debug, Clone)]
pub struct EnvironmentVariables {
    postgre_db_network_name: String,
}

mod utils;

mod internal_api_service;
use internal_api_service::internal_api_service_implementation;

#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    // - postgre_db_network_name=db

    let mut environment_variables: EnvironmentVariables = EnvironmentVariables {
        postgre_db_network_name: String::from("http://127.0.0.1:5432/"),
    };

    match env::var_os("postgres_db_network_name") {
        Some(v) => {
            environment_variables.postgre_db_network_name =
                String::from("http://") + v.to_str().unwrap() + ":5432/";
        }
        None => println!("environment_variable 'postgres_db_network_name' is not set"),
    };

    let _res = tokio::try_join!(
        internal_api_service_implementation::run(
            environment_variables.clone(), 
            "0.0.0.0".to_string(), 
            "40050".to_string()),
    );

    Ok(())
}
