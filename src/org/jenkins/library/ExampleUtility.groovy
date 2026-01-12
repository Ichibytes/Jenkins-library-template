package org.jenkins.library

/**
 * Example utility class for Jenkins shared library
 * 
 * Note: Classes used in Jenkins pipelines should implement Serializable
 * to ensure proper serialization during pipeline execution
 */
class ExampleUtility implements Serializable {
    
    private static final long serialVersionUID = 1L
    
    /**
     * Example utility method
     * @param input Input string
     * @return Processed output
     */
    static String processInput(String input) {
        if (!input) {
            return "Empty input"
        }
        return "Processed: ${input.toUpperCase()}"
    }
    
    /**
     * Example method that validates input
     * @param value Value to validate
     * @return true if valid, false otherwise
     */
    static boolean validate(String value) {
        return value != null && !value.trim().isEmpty()
    }
}

