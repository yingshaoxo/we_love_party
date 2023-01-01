use std::sync::{Arc, Mutex};
// use std::collections::HashMap;

#[derive(Debug, Clone)]
pub struct PostgreSqlDatabaseHandler {
    pub postgre_sql_address: Arc<Mutex<String>>,
}

impl PostgreSqlDatabaseHandler {
    pub async fn say_hi(
        &self,
        name: String,
    ) -> String {
        return format!("Hi, {name}", name = name);
    }

    // pub async fn user_register_request(
    //     &self,
    //     email: String,
    // ) -> Result<bool, Box<dyn std::error::Error>> {
    //     // This will POST a body of `{"lang":"rust","body":"json"}`
    //     let mut map = HashMap::new();
    //     map.insert("email", email);

    //     let client = reqwest::Client::new();
    //     let sub_url = "user_register_request/";
    //     let mut api_address = String::from("");
    //     match self.postgre_sql_address.lock() {
    //         Ok(address) => api_address = address.clone().as_str().to_string() + sub_url,
    //         Err(_error) => {}
    //     };
    //     let response = client.post(api_address).json(&map).send().await?;

    //     if response.status().is_success() {
    //         let json_response = response.json::<serde_json::Value>().await?;
    //         let the_error = &json_response["error"];
    //         if the_error != &serde_json::Value::Null {
    //             return Ok(false);
    //         }
    //         return Ok(true);
    //     } else {
    //         return Ok(false);
    //     }
    // }

}