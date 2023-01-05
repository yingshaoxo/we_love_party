use std::env;

#[derive(Debug, Clone)]
pub struct EnvironmentVariables {
    // - postgre_db_network_name=db
    pub postgres_sql_host: String,
    pub postgres_sql_user: String,
    pub postgres_sql_password: String,
}

pub fn get_environment_variables() -> EnvironmentVariables {
    let mut environment_variables: EnvironmentVariables = EnvironmentVariables {
        postgres_sql_host: String::from("127.0.0.1"),
        postgres_sql_user: String::from("yingshaoxo"),
        postgres_sql_password: String::from("yingshaoxo"),
    };

    match env::var_os("postgres_sql_host") {
        Some(v) => {
            environment_variables.postgres_sql_host =
                String::from("http://") + v.to_str().unwrap() + ":5432/";
        }
        None => println!("environment_variable 'postgres_sql_host' is not set"),
    };

    match env::var_os("postgres_sql_user") {
        Some(v) => {
            environment_variables.postgres_sql_user = v.to_str().unwrap().to_string();
        }
        None => println!("environment_variable 'postgres_sql_user' is not set"),
    };

    match env::var_os("postgres_sql_password") {
        Some(v) => {
            environment_variables.postgres_sql_password = v.to_str().unwrap().to_string();
        }
        None => println!("environment_variable 'postgres_sql_password' is not set"),
    };

    return environment_variables;
}