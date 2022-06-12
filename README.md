# TestAn

A tool to quickly and easily set up an environment that allows you to test the analytics layer through UI testing.

## Features

This tool generates all the necessary classes to automate analytical layer testing by adding the following classes and extensions:

* AnalyticsServiceMock that saves serialized event data to the clipboard
* ServiceLocator that injects the service depending on the app launch parameters
* Extensions for an event that allow it to be serialized
* ProcessInfo extensions for nested app launch parameters
* AnalyticsTestBase that contains all the necessary tools for testing
* Templates for your tests that depends on your events

## Getting Started

1. Install this package via Swift Package Manager
2. Generate config 
   ```sh
   swift run testan generate_config_template
   ```
3. Fill nested fields in generated config template
4. Generate files based on your config
   ```sh
   swift run testan generate_tests <config path>
   ```
5. In the generated tests, describe the steps required to call the event


