(declare-fun T_1 () Bool)
(declare-fun var_0xINPUT_101806 () String)
(assert (= T_1 (not (= "file:" var_0xINPUT_101806))))
(assert T_1)
(check-sat)
