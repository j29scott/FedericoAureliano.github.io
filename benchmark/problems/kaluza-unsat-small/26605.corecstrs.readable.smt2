(declare-fun T1_4 () String)
(declare-fun T1_7 () String)
(declare-fun T2_4 () String)
(declare-fun T2_7 () String)
(declare-fun T_1 () String)
(declare-fun T_2 () Bool)
(declare-fun T_3 () Bool)
(declare-fun T_4 () String)
(declare-fun T_5 () Bool)
(declare-fun var_0xINPUT_89831 () String)
(assert (= T_1 (str.++ T1_4 T2_4)))
(assert (= T2_4 var_0xINPUT_89831))
(assert (= T1_4 ""))
(assert (= T_2 (= "-" T_1)))
(assert (= T_3 (not T_2)))
(assert T_3)
(assert (= T_4 (str.++ T1_7 T2_7)))
(assert (= T2_7 var_0xINPUT_89831))
(assert (= T1_7 ""))
(assert (= T_5 (= "" T_4)))
(assert T_5)
(check-sat)
