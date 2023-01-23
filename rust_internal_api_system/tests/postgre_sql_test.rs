#[cfg(test)]

mod tests {
    use rust_service::grpc_key_string_maps::data_model;
    use rust_service::internal_api_service::internal_api_service_implementation::grpc_internal_api_service;
    use rust_service::internal_api_service::postgre_sql_database_handler::PostgreSqlDatabaseHandler;
    use rust_service::environment_module::basic::get_environment_variables;

    #[tokio::test]
    async fn create_a_table() {
        let postgre_sql_handler = PostgreSqlDatabaseHandler{
            environment_variables: get_environment_variables()
        };
        let client = postgre_sql_handler.get_postgre_sql_client().await.unwrap();

        let raw_command = r#"
        CREATE TABLE IF NOT EXISTS users (
            id SERIAL, 
            email VARCHAR(255) UNIQUE NOT NULL
        );
        "#;

        client.batch_execute(raw_command).await.unwrap();
    }


    #[tokio::test]
    async fn insert_a_user() {
        let postgre_sql_handler = PostgreSqlDatabaseHandler{
            environment_variables: get_environment_variables()
        };
        let client = postgre_sql_handler.get_postgre_sql_client().await.unwrap();

        client.execute("
            INSERT INTO users (email) 
            VALUES ($1), ($2)
            ON CONFLICT (email) DO NOTHING;
            ", &[&"yingshaoxo@gmail.com", &"1576570260@qq.com"]).await.unwrap();
    }


    #[tokio::test]
    async fn get_all_users() {
        let postgre_sql_handler = PostgreSqlDatabaseHandler{
            environment_variables: get_environment_variables()
        };
        let client = postgre_sql_handler.get_postgre_sql_client().await.unwrap();

        let rows = client
        .query("SELECT * FROM \"user\";", &[])
        .await.unwrap();

        for row in rows {
            println!("{:?}", row.get::<_, &str>("email"));
            println!("{:?}", row.get::<_, i32>("age"));
            // println!("{:?}", row);
        }
    }


    #[tokio::test]
    async fn delete_a_users() {
        let postgre_sql_handler = PostgreSqlDatabaseHandler{
            environment_variables: get_environment_variables()
        };
        let client = postgre_sql_handler.get_postgre_sql_client().await.unwrap();

        client.execute("
            DELETE FROM users
            WHERE email = '1576570260@qq.com';
        ", &[]).await.unwrap();
    }


    #[tokio::test]
    async fn get_a_user() {
        let postgre_sql_database_handler = PostgreSqlDatabaseHandler{
            environment_variables: get_environment_variables()
        };
        let client = postgre_sql_database_handler.get_postgre_sql_client().await.unwrap();

        let email = "yingshaoxo@gmail.com";
        let mut default_reply = grpc_internal_api_service::GetUserResponse {
            user_exists: false,
            email: "".to_string(),
            username: Some("".to_string()),
            head_image: Some("".to_string()),
            sex: Some(1),
            age: Some(24),
            error: Some("Unknonw error".to_string()),
        };

        let rows = client
        .query(
            r#"SELECT * FROM "user" WHERE email=$1;"#, 
            &[
                &email
            ]
        )
        .await.unwrap();
        if rows.len() == 0 {
            default_reply.user_exists = false;
            default_reply.error = None;
            return
        }

        default_reply.error = None;
        default_reply.user_exists = true;
        default_reply.email = rows[0].get::<_, &str>(data_model::User::email).to_string();
        default_reply.username = Some(rows[0].get::<_, &str>(data_model::User::username).to_string());
        default_reply.sex = Some(rows[0].get::<&str, i32>(data_model::User::sex));
        default_reply.age = Some(rows[0].get::<&str, i32>(data_model::User::age));
        default_reply.head_image = Some(rows[0].get::<_, &str>(data_model::User::head_image).to_string());

        println!("{:?}", default_reply)

    }
}