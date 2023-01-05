use std::env;

#[derive(Debug, Clone)]
pub struct EnvironmentVariables {
    // - postgre_db_network_name=db
    pub postgre_db_network_name: String,
    pub postgres_user: String,
    pub postgres_password: String,
}

pub fn get_environment_variables() -> EnvironmentVariables {
    let mut environment_variables: EnvironmentVariables = EnvironmentVariables {
        postgre_db_network_name: String::from("127.0.0.1"),
        postgres_user: String::from("yingshaoxo"),
        postgres_password: String::from("yingshaoxo"),
    };

    match env::var_os("postgre_db_network_name") {
        Some(v) => {
            environment_variables.postgre_db_network_name =
                String::from("http://") + v.to_str().unwrap() + ":5432/";
        }
        None => println!("environment_variable 'postgre_db_network_name' is not set"),
    };

    match env::var_os("postgres_user") {
        Some(v) => {
            environment_variables.postgres_user = v.to_str().unwrap().to_string();
        }
        None => println!("environment_variable 'postgres_user' is not set"),
    };

    match env::var_os("postgres_password") {
        Some(v) => {
            environment_variables.postgres_password = v.to_str().unwrap().to_string();
        }
        None => println!("environment_variable 'postgres_password' is not set"),
    };

    return environment_variables;
}