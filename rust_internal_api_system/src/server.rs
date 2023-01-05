#![allow(dead_code)]
#![allow(unused_variables)]
#![allow(non_snake_case)]
#![allow(unused_imports)]

// pub mod utils;
// pub mod environment_module;
// pub mod internal_api_service;
// use environment_module::basic;
// use internal_api_service::internal_api_service_implementation;

use rust_service::internal_api_service;
use rust_service::environment_module;

#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    let _res = tokio::try_join!(
    internal_api_service::internal_api_service_implementation::run(
            environment_module::basic::get_environment_variables().clone(), 
            "0.0.0.0".to_string(), 
            "40050".to_string()),
    );

    Ok(())
}
