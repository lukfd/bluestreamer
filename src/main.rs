mod bluetooth;

fn main() {
    let command = std::env::args().nth(1).expect("No command provided");

    if command == "start" {
        println!("Starting the application...");
        bluetooth::connect();
    } else if command == "list" {
        println!("Listing items...");
        // Add your list logic here
    } else {
        eprintln!("Unknown command: {}", command);
    }
}
