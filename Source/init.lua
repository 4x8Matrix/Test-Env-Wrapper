local TestService = game:GetService("TestService")

local TestMacroWrapper = { }

TestMacroWrapper.Check = { }
TestMacroWrapper.Require = { }
TestMacroWrapper.Warn = { }

function TestMacroWrapper:Message(msg: string): ()
	local callingEnvironment = getfenv(2)
	local callingScriptLn = debug.info(2, "l")

	return TestService:Message(msg, callingEnvironment["script"], callingScriptLn)
end

function TestMacroWrapper:Error(msg: string): ()
	local callingEnvironment = getfenv(2)
	local callingScriptLn = debug.info(2, "l")

	return TestService:Error(msg, callingEnvironment["script"], callingScriptLn)
end

function TestMacroWrapper:Fail(msg: string): ()
	local callingEnvironment = getfenv(2)
	local callingScriptLn = debug.info(2, "l")

	return TestService:Fail(msg, callingEnvironment["script"], callingScriptLn)
end

function TestMacroWrapper.Check:Check(cond: boolean)
	local callingEnvironment = getfenv(2)
	local callingScriptLn = debug.info(2, "l")

	TestService:Check(cond, "test failed:" .. tostring(cond), callingEnvironment["script"], callingScriptLn)
end

function TestMacroWrapper.Check:Message(cond: boolean, message: string)
	local callingEnvironment = getfenv(2)
	local callingScriptLn = debug.info(2, "l")

	TestService:Check(cond, message, callingEnvironment["script"], callingScriptLn)
end

function TestMacroWrapper.Check:Throw(func: () -> ())
	local callingEnvironment = getfenv(2)
	local callingScriptLn = debug.info(2, "l")

	local success = pcall(func)

	TestService:Check(not success, "test failed: method did not throw", callingEnvironment["script"], callingScriptLn)
end

function TestMacroWrapper.Check:NoThrow(func: () -> ())
	local callingEnvironment = getfenv(2)
	local callingScriptLn = debug.info(2, "l")

	local thread = coroutine.create(func)
	local success, message = pcall(thread)

	TestService:Check(success, "test failed: " .. message .. "\n" .. debug.traceback(thread), callingEnvironment["script"], callingScriptLn)
end

function TestMacroWrapper.Check:Equal<T>(a: T, b: T)
	local callingEnvironment = getfenv(2)
	local callingScriptLn = debug.info(2, "l")

	TestService:Check(a == b, "test failed: " .. tostring(a) .. " == " .. tostring(b), callingEnvironment["script"], callingScriptLn)
end

function TestMacroWrapper.Check:NotEqual<A, B>(a: A, b: B)
	local callingEnvironment = getfenv(2)
	local callingScriptLn = debug.info(2, "l")

	TestService:Check(a ~= b, "test failed: " .. tostring(a) .. " ~= " .. tostring(b), callingEnvironment["script"], callingScriptLn)
end

function TestMacroWrapper.Check:GreaterOrEqualTo(a: number, b: number)
	local callingEnvironment = getfenv(2)
	local callingScriptLn = debug.info(2, "l")

	TestService:Check(a >= b, "test failed: " .. tostring(a) .. " >= " .. tostring(b), callingEnvironment["script"], callingScriptLn)
end

function TestMacroWrapper.Check:LesserOrEqualTo(a: number, b: number)
	local callingEnvironment = getfenv(2)
	local callingScriptLn = debug.info(2, "l")

	TestService:Check(a <= b, "test failed: " .. tostring(a) .. " <= " .. tostring(b), callingEnvironment["script"], callingScriptLn)
end

function TestMacroWrapper.Check:GreaterThan(a: number, b: number)
	local callingEnvironment = getfenv(2)
	local callingScriptLn = debug.info(2, "l")

	TestService:Check(a >= b, "test failed: " .. tostring(a) .. " >= " .. tostring(b), callingEnvironment["script"], callingScriptLn)
end

function TestMacroWrapper.Check:LesserThan(a: number, b: number)
	local callingEnvironment = getfenv(2)
	local callingScriptLn = debug.info(2, "l")

	TestService:Check(a <= b, "test failed: " .. tostring(a) .. " <= " .. tostring(b), callingEnvironment["script"], callingScriptLn)
end

function TestMacroWrapper.Require:Require(cond: boolean)
	local callingEnvironment = getfenv(2)
	local callingScriptLn = debug.info(2, "l")

	TestService:Require(cond, "test failed:" .. tostring(cond), callingEnvironment["script"], callingScriptLn)
end

function TestMacroWrapper.Require:Message(cond: boolean, message: string)
	local callingEnvironment = getfenv(2)
	local callingScriptLn = debug.info(2, "l")

	TestService:Require(cond, message, callingEnvironment["script"], callingScriptLn)
end

function TestMacroWrapper.Require:Throw(func: () -> ())
	local callingEnvironment = getfenv(2)
	local callingScriptLn = debug.info(2, "l")

	local success = pcall(func)

	TestService:Require(not success, "test failed: method did not throw", callingEnvironment["script"], callingScriptLn)
end

function TestMacroWrapper.Require:NoThrow(func: () -> ())
	local callingEnvironment = getfenv(2)
	local callingScriptLn = debug.info(2, "l")

	local thread = coroutine.create(func)
	local success, message = pcall(thread)

	TestService:Require(success, "test failed: " .. message .. "\n" .. debug.traceback(thread), callingEnvironment["script"], callingScriptLn)
end

function TestMacroWrapper.Require:Equal<T>(a: T, b: T)
	local callingEnvironment = getfenv(2)
	local callingScriptLn = debug.info(2, "l")

	TestService:Require(a == b, "test failed: " .. tostring(a) .. " == " .. tostring(b), callingEnvironment["script"], callingScriptLn)
end

function TestMacroWrapper.Require:NotEqual<A, B>(a: A, b: B)
	local callingEnvironment = getfenv(2)
	local callingScriptLn = debug.info(2, "l")

	TestService:Require(a ~= b, "test failed: " .. tostring(a) .. " ~= " .. tostring(b), callingEnvironment["script"], callingScriptLn)
end

function TestMacroWrapper.Require:GreaterOrEqualTo(a: number, b: number)
	local callingEnvironment = getfenv(2)
	local callingScriptLn = debug.info(2, "l")

	TestService:Require(a >= b, "test failed: " .. tostring(a) .. " >= " .. tostring(b), callingEnvironment["script"], callingScriptLn)
end

function TestMacroWrapper.Require:LesserOrEqualTo(a: number, b: number)
	local callingEnvironment = getfenv(2)
	local callingScriptLn = debug.info(2, "l")

	TestService:Require(a <= b, "test failed: " .. tostring(a) .. " <= " .. tostring(b), callingEnvironment["script"], callingScriptLn)
end

function TestMacroWrapper.Require:GreaterThan(a: number, b: number)
	local callingEnvironment = getfenv(2)
	local callingScriptLn = debug.info(2, "l")

	TestService:Require(a >= b, "test failed: " .. tostring(a) .. " >= " .. tostring(b), callingEnvironment["script"], callingScriptLn)
end

function TestMacroWrapper.Require:LesserThan(a: number, b: number)
	local callingEnvironment = getfenv(2)
	local callingScriptLn = debug.info(2, "l")

	TestService:Require(a <= b, "test failed: " .. tostring(a) .. " <= " .. tostring(b), callingEnvironment["script"], callingScriptLn)
end

function TestMacroWrapper.Warn:Warn(cond: boolean)
	local callingEnvironment = getfenv(2)
	local callingScriptLn = debug.info(2, "l")

	TestService:Warn(cond, "test failed:" .. tostring(cond), callingEnvironment["script"], callingScriptLn)
end

function TestMacroWrapper.Warn:Message(cond: boolean, message: string)
	local callingEnvironment = getfenv(2)
	local callingScriptLn = debug.info(2, "l")

	TestService:Warn(cond, message, callingEnvironment["script"], callingScriptLn)
end

function TestMacroWrapper.Warn:Throw(func: () -> ())
	local callingEnvironment = getfenv(2)
	local callingScriptLn = debug.info(2, "l")

	local success = pcall(func)

	TestService:Warn(not success, "test failed: Expected function to throw", callingEnvironment["script"], callingScriptLn)
end

function TestMacroWrapper.Warn:NoThrow(func: () -> ())
	local callingEnvironment = getfenv(2)
	local callingScriptLn = debug.info(2, "l")

	local thread = coroutine.create(func)
	local success, message = pcall(thread)

	TestService:Warn(success, "test failed: " .. message .. "\n" .. debug.traceback(thread), callingEnvironment["script"], callingScriptLn)
end

function TestMacroWrapper.Warn:Equal<T>(a: T, b: T)
	local callingEnvironment = getfenv(2)
	local callingScriptLn = debug.info(2, "l")

	TestService:Warn(a == b, "test failed: " .. tostring(a) .. " == " .. tostring(b), callingEnvironment["script"], callingScriptLn)
end

function TestMacroWrapper.Warn:NotEqual<A, B>(a: A, b: B)
	local callingEnvironment = getfenv(2)
	local callingScriptLn = debug.info(2, "l")

	TestService:Warn(a ~= b, "test failed: " .. tostring(a) .. " ~= " .. tostring(b), callingEnvironment["script"], callingScriptLn)
end

function TestMacroWrapper.Warn:GreaterOrEqualTo(a: number, b: number)
	local callingEnvironment = getfenv(2)
	local callingScriptLn = debug.info(2, "l")

	TestService:Warn(a >= b, "test failed: " .. tostring(a) .. " >= " .. tostring(b), callingEnvironment["script"], callingScriptLn)
end

function TestMacroWrapper.Warn:LesserOrEqualTo(a: number, b: number)
	local callingEnvironment = getfenv(2)
	local callingScriptLn = debug.info(2, "l")

	TestService:Warn(a <= b, "test failed: " .. tostring(a) .. " <= " .. tostring(b), callingEnvironment["script"], callingScriptLn)
end

function TestMacroWrapper.Warn:GreaterThan(a: number, b: number)
	local callingEnvironment = getfenv(2)
	local callingScriptLn = debug.info(2, "l")

	TestService:Warn(a >= b, "test failed: " .. tostring(a) .. " >= " .. tostring(b), callingEnvironment["script"], callingScriptLn)
end

function TestMacroWrapper.Warn:LesserThan(a: number, b: number)
	local callingEnvironment = getfenv(2)
	local callingScriptLn = debug.info(2, "l")

	TestService:Warn(a <= b, "test failed: " .. tostring(a) .. " <= " .. tostring(b), callingEnvironment["script"], callingScriptLn)
end

return TestMacroWrapper :: typeof(TestMacroWrapper)