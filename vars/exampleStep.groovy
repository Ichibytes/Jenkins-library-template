#!/usr/bin/env groovy

/**
 * Example global pipeline step
 * 
 * Usage:
 *   exampleStep {
 *     message = 'Hello from Jenkins Library'
 *   }
 * 
 * This step demonstrates:
 * - Configuration via Map
 * - Default values
 * - Resource file access
 */
def call(Map config) {
    def message = config.message ?: 'Default message'
    def timeout = config.timeout ?: 60
    
    echo "Executing exampleStep with message: ${message}"
    echo "Step will timeout after ${timeout} seconds"
    
    // Example: Reading a resource file
    def resourceContent = libraryResource('example-resource.txt')
    echo "Resource file content: ${resourceContent.trim()}"
}

