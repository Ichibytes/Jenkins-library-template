import org.junit.*
import static org.junit.Assert.*
import org.jenkins.library.ExampleUtility

/**
 * Test for ExampleUtility class
 */
class ExampleUtilityTest {
    
    @Test
    void testProcessInput() {
        String result = ExampleUtility.processInput("hello")
        assertEquals("Processed: HELLO", result)
    }
    
    @Test
    void testProcessInputEmpty() {
        String result = ExampleUtility.processInput("")
        assertEquals("Empty input", result)
    }
    
    @Test
    void testProcessInputNull() {
        String result = ExampleUtility.processInput(null)
        assertEquals("Empty input", result)
    }
    
    @Test
    void testValidate() {
        assertTrue(ExampleUtility.validate("valid"))
        assertFalse(ExampleUtility.validate(""))
        assertFalse(ExampleUtility.validate(null))
        assertFalse(ExampleUtility.validate("   "))
    }
}

