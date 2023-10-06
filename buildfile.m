function plan = buildfile()
% BUILDFILE File invoked by automated build

    % Create a plan from task functions.
    plan = buildplan(localfunctions());

    % Add the "check" task to identify code issues.
    sourceFolder = "src";

    plan("check") = matlab.buildtool.tasks.CodeIssuesTask(sourceFolder);

    % Add the "test" task to run tests.
    testFolder = "tests";

    plan("test") = matlab.buildtool.tasks.TestTask(testFolder, ...
        SourceFiles = sourceFolder, ...
        TestResults = fullfile(testFolder, "artifacts/results.xml"), ...
        CodeCoverageResults = fullfile(testFolder, "artifacts/coverage.xml"));

    % Make sure tasks run by default.
    plan.DefaultTasks = ["check", "test"];
end
