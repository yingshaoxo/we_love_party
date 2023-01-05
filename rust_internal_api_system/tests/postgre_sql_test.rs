#[cfg(test)]

mod tests {
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
        .query("SELECT * FROM users;", &[])
        .await.unwrap();

        // println!("{:?}", rows.len());
        for row in rows {
            println!("{:?}", row.get::<_, &str>("email"));
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
}