function plan = buildfile()
% BUILDFILE File invoked by automated build

    % Create a plan from task functions.
    plan = buildplan(localfunctions);

    % Add the "check" task to identify code issues.
    plan("check") = matlab.buildtool.tasks.CodeIssuesTask();

    % Add the "test" task to run tests.
    plan("test") = matlab.buildtool.tasks.TestTask();

    % Make the "archive" task the default task in the plan.
    plan.DefaultTasks = "test";
end
