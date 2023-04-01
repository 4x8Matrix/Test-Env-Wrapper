local TestEnvWrapper = { }

function TestEnvWrapper.compileRBXResourceLibrary()
	local callingEnvironment = getfenv(2)

	return {
		["Check"] = setmetatable({
			["Message"] = callingEnvironment.RBX_CHECK_MESSAGE :: (cond: boolean, failMsg: string) -> (),
			["Throw"] = callingEnvironment.RBX_CHECK_THROW :: (func: () -> ()) -> (),
			["NoThrow"] = callingEnvironment.RBX_CHECK_NO_THROW :: (func: () -> ()) -> (),
			["Equal"] = callingEnvironment.RBX_CHECK_EQUAL :: <T>(a: T, b: T) -> (),
			["NotEqual"] = callingEnvironment.RBX_CHECK_NE :: <A, B>(a: A, b: B) -> (),
			["GreaterEqual"] = callingEnvironment.RBX_CHECK_GE :: (a: number, b: number) -> (),
			["LesserEqual"] = callingEnvironment.RBX_CHECK_LE :: (a: number, b: number) -> (),
			["GreaterThan"] = callingEnvironment.RBX_CHECK_GT :: (a: number, b: number) -> (),
			["LesserThan"] = callingEnvironment.RBX_CHECK_LT :: (a: number, b: number) -> (),
		}, {
			__call = callingEnvironment.RBX_CHECK :: (cond: boolean) -> ()
		}),
		["Require"] = setmetatable({
			["Message"] = callingEnvironment.RBX_REQUIRE_MESSAGE :: (cond: boolean, failMsg: string) -> (),
			["Throw"] = callingEnvironment.RBX_REQUIRE_THROW :: (func: () -> ()) -> (),
			["NoThrow"] = callingEnvironment.RBX_REQUIRE_NO_THROW :: (func: () -> ()) -> (),
			["Equal"] = callingEnvironment.RBX_REQUIRE_EQUAL :: <T>(a: T, b: T) -> (),
			["NotEqual"] = callingEnvironment.RBX_REQUIRE_NE :: <A, B>(a: A, b: B) -> (),
			["GreaterEqual"] = callingEnvironment.RBX_REQUIRE_GE :: (a: number, b: number) -> (),
			["LesserEqual"] = callingEnvironment.RBX_REQUIRE_LE :: (a: number, b: number) -> (),
			["GreaterThan"] = callingEnvironment.RBX_REQUIRE_GT :: (a: number, b: number) -> (),
			["LesserThan"] = callingEnvironment.RBX_REQUIRE_LT :: (a: number, b: number) -> (),
		}, {
			__call = callingEnvironment.RBX_REQUIRE :: (cond: boolean) -> ()
		}),
		["Warn"] = setmetatable({
			["Message"] = callingEnvironment.RBX_WARN_MESSAGE :: (cond: boolean, failMsg: string) -> (),
			["Throw"] = callingEnvironment.RBX_WARN_THROW :: (func: () -> ()) -> (),
			["NoThrow"] = callingEnvironment.RBX_WARN_NO_THROW :: (func: () -> ()) -> (),
			["Equal"] = callingEnvironment.RBX_WARN_EQUAL :: <T>(a: T, b: T) -> (),
			["NotEqual"] = callingEnvironment.RBX_WARN_NE :: <A, B>(a: A, b: B) -> (),
			["GreaterEqual"] = callingEnvironment.RBX_WARN_GE :: (a: number, b: number) -> (),
			["LesserEqual"] = callingEnvironment.RBX_WARN_LE :: (a: number, b: number) -> (),
			["GreaterThan"] = callingEnvironment.RBX_WARN_GT :: (a: number, b: number) -> (),
			["LesserThan"] = callingEnvironment.RBX_WARN_LT :: (a: number, b: number) -> (),
		}, {
			__call = callingEnvironment.RBX_WARN :: (cond: boolean) -> ()
		}),

		["Error"] = callingEnvironment.RBX_ERROR :: (msg: string) -> (),
		["Fail"] = callingEnvironment.RBX_FAIL :: (msg: string) -> (),
		["Message"] = callingEnvironment.RBX_MESSAGE :: (msg: string) -> (),
	}
end

return TestEnvWrapper