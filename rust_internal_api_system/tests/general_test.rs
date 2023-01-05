#[cfg(test)]
mod tests {
    use tokio::time::{sleep, Duration};

    #[test]
    fn test_equality() {
        assert_eq!(5, 5);
    }

    #[test]
    #[should_panic]
    fn test_any_panic() {
        panic!("should panic");
    }

    #[test]
    #[should_panic(expected = "error message 1")]
    fn test_specific_panic() {
        panic!("error message 1");
    }

    #[tokio::test]
    async fn test_something_async() {
        sleep(Duration::from_millis(1000)).await;
        println!("1000 ms have elapsed");
    }
}