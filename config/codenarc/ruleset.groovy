ruleset {
    description 'CodeNarc ruleset for Jenkins Shared Library'
    
    // Size and complexity
    ClassSize(maxLines: 1000)
    MethodSize(maxLines: 100)
    CyclomaticComplexity(maxMethodComplexity: 15)
    
    // Empty code blocks
    EmptyCatchBlock
    EmptyIfStatement
    EmptyElseBlock
    EmptyFinallyBlock
    EmptyForStatement
    EmptyWhileStatement
    EmptySwitchStatement
    EmptyTryBlock
    EmptyMethod
    
    // Code quality
    ConfusingTernary
    DeadCode
    DoubleNegative
    DuplicateMapKey
    DuplicateSetValue
    GStringAsMapKey
    GStringExpressionWithinString
    HardCodedWindowsFileSeparator
    HardCodedWindowsRootDirectory
    IfStatementCouldBeTernary
    ParameterCount(maxParameters: 5)
    PublicInstanceField
    
    // Unnecessary code
    UnnecessaryBooleanExpression
    UnnecessaryBooleanInstantiation
    UnnecessaryCast
    UnnecessaryCatchBlock
    UnnecessaryConstructor
    UnnecessaryDefInFieldDeclaration
    UnnecessaryDefInMethodDeclaration
    UnnecessaryDefInVariableDeclaration
    UnnecessaryDotClass
    UnnecessaryDoubleInstantiation
    UnnecessaryElseStatement
    UnnecessaryFinalOnPrivateMethod
    UnnecessaryFloatInstantiation
    UnnecessaryGString
    UnnecessaryGetter
    UnnecessaryIfStatement
    UnnecessaryInstanceOfCheck
    UnnecessaryInstantiationToGetClass
    UnnecessaryIntegerInstantiation
    UnnecessaryLongInstantiation
    UnnecessaryNullCheck
    UnnecessaryNullCheckBeforeInstanceOf
    UnnecessaryObjectReferences
    UnnecessaryOverridingMethod
    UnnecessaryPackageReference
    UnnecessaryParenthesesForMethodCallWithClosure
    UnnecessaryPublicModifier
    UnnecessaryReturnKeyword
    UnnecessarySafeNavigationOperator
    UnnecessarySelfAssignment
    UnnecessarySemicolon
    UnnecessaryStringInstantiation
    UnnecessaryTernaryExpression
    UnnecessaryToString
    UnnecessaryTransientModifier
    
    // Unused code
    UnusedImport
    UnusedPrivateField
    UnusedPrivateMethod
    UnusedPrivateMethodParameter
    UnusedVariable
    
    // Best practices
    SystemOutPrint
    SystemErrPrint
}
