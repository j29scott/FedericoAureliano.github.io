(declare-fun T_1 () Bool)
(declare-fun T_2 () Bool)
(declare-fun var_0xINPUT_352115 () String)
(assert (= T_1 (not (= "" var_0xINPUT_352115))))
(assert T_1)
(assert (= T_2 (= var_0xINPUT_352115 "array")))
(assert T_2)
(check-sat)
