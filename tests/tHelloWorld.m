classdef tHelloWorld < matlab.unittest.TestCase
% THELLOWORLD Test for "helloWorld" function.

    methods (TestClassSetup)

        function addSourceToPath(testCase)
            testCase.applyFixture(matlab.unittest.fixtures.PathFixture(fullfile("../src")));
        end
    end

    methods (Test)

        function helloWorld(testCase)

            % Exercise.
            value = helloWorld();

            % Verify.
            testCase.verifyEqual(value, "Hello World", "String should match.");
        end
    end
end
