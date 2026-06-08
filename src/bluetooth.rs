use cpal::traits::{DeviceTrait, HostTrait};

pub fn connect() {
    let host = cpal::default_host();
    let input_device = host.default_input_device().expect("No Bluetooth source found");
    let config = input_device.default_input_config().unwrap();

    println!("Connected to Bluetooth audio source: {}", input_device.name().unwrap());
}