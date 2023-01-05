fn main() -> Result<(), Box<dyn std::error::Error>> {
    // tonic_build::compile_protos("../party_protocols/protocols/internal_api_service.proto")?;

    tonic_build::compile_protos("./protocols/internal_api_service.proto")?;

    Ok(())
}
