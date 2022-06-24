use actix_files::Files;
use actix_web::{App, HttpServer};

#[actix_web::main]
async fn main() -> std::io::Result<()> {

    HttpServer::new(|| App::new().service(
        Files::new("/", "/staticfiles").prefer_utf8(true).index_file("index.html")))
        .bind(("0.0.0.0", 8080))?
        .run()
        .await
}