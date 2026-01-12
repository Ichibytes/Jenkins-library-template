import org.junit.*
import static org.junit.Assert.*
import com.lesfurets.jenkins.unit.*
import static groovy.test.GroovyAssert.*

/**
 * Test for exampleStep global pipeline step
 */
class ExampleStepTest extends BasePipelineTest {
    
    @Override
    @Before
    void setUp() {
        super.setUp()
        // Register common Jenkins pipeline steps
        helper.registerAllowedMethod('echo', [String.class], null)
        // Register libraryResource method for resource file access
        helper.registerAllowedMethod('libraryResource', [String.class], { String path ->
            return "This is an example resource file.\nResources in the resources/ directory can be accessed from pipeline steps.\n"
        })
    }
    
    @Test
    void testExampleStepWithMessage() {
        def script = loadScript('vars/exampleStep.groovy')
        
        script.call([
            message: 'Test message',
            timeout: 30
        ])
        
        // Verify echo was called
        assertTrue(helper.callStack.findAll { call ->
            call.methodName == 'echo'
        }.any { call ->
            call.argsToString().contains('Test message')
        })
    }
    
    @Test
    void testExampleStepWithDefaults() {
        def script = loadScript('vars/exampleStep.groovy')
        
        script.call([:])
        
        // Verify default message was used
        assertTrue(helper.callStack.findAll { call ->
            call.methodName == 'echo'
        }.any { call ->
            call.argsToString().contains('Default message')
        })
    }
}

