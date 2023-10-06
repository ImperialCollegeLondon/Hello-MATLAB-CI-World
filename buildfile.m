function plan = buildfile()
% BUILDFILE File invoked by automated build

    % Create a plan from task functions.
    plan = buildplan(localfunctions());

    % Add the "check" task to identify code issues.
    plan("check") = matlab.buildtool.tasks.CodeIssuesTask("src");

    % Add the "test" task to run tests.
    plan("test") = matlab.buildtool.tasks.TestTask("tests");

    % Make sure tasks run by default.
    plan.DefaultTasks = ["check", "test"];
end
