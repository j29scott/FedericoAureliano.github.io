(declare-fun T1_12 () String)
(declare-fun T1_16 () String)
(declare-fun T1_20 () String)
(declare-fun T1_24 () String)
(declare-fun T1_28 () String)
(declare-fun T1_31 () String)
(declare-fun T1_4 () String)
(declare-fun T1_8 () String)
(declare-fun T2_12 () String)
(declare-fun T2_16 () String)
(declare-fun T2_20 () String)
(declare-fun T2_24 () String)
(declare-fun T2_28 () String)
(declare-fun T2_31 () String)
(declare-fun T2_4 () String)
(declare-fun T2_8 () String)
(declare-fun T_1 () String)
(declare-fun T_10 () String)
(declare-fun T_11 () Bool)
(declare-fun T_12 () Bool)
(declare-fun T_13 () String)
(declare-fun T_14 () Bool)
(declare-fun T_15 () Bool)
(declare-fun T_16 () String)
(declare-fun T_17 () Bool)
(declare-fun T_2 () Bool)
(declare-fun T_3 () Bool)
(declare-fun T_4 () String)
(declare-fun T_5 () Bool)
(declare-fun T_6 () Bool)
(declare-fun T_7 () String)
(declare-fun T_8 () Bool)
(declare-fun T_9 () Bool)
(declare-fun T_a () String)
(declare-fun T_b () Bool)
(declare-fun T_c () Bool)
(declare-fun T_d () String)
(declare-fun T_e () Bool)
(declare-fun T_f () Bool)
(declare-fun var_0xINPUT_14928 () String)
(assert (= T_1 (str.++ T1_4 T2_4)))
(assert (= T2_4 var_0xINPUT_14928))
(assert (= T1_4 ""))
(assert (= T_2 (= "-" T_1)))
(assert (= T_3 (not T_2)))
(assert T_3)
(assert (= T_4 (str.++ T1_8 T2_8)))
(assert (= T2_8 var_0xINPUT_14928))
(assert (= T1_8 ""))
(assert (= T_5 (= "" T_4)))
(assert (= T_6 (not T_5)))
(assert T_6)
(assert (= T_7 (str.++ T1_12 T2_12)))
(assert (= T2_12 var_0xINPUT_14928))
(assert (= T1_12 ""))
(assert (= T_8 (= "" T_7)))
(assert (= T_9 (not T_8)))
(assert T_9)
(assert (= T_a (str.++ T1_16 T2_16)))
(assert (= T2_16 var_0xINPUT_14928))
(assert (= T1_16 ""))
(assert (= T_b (= "" T_a)))
(assert (= T_c (not T_b)))
(assert T_c)
(assert (= T_d (str.++ T1_20 T2_20)))
(assert (= T2_20 var_0xINPUT_14928))
(assert (= T1_20 ""))
(assert (= T_e (= "-" T_d)))
(assert (= T_f (not T_e)))
(assert T_f)
(assert (= T_10 (str.++ T1_24 T2_24)))
(assert (= T2_24 var_0xINPUT_14928))
(assert (= T1_24 ""))
(assert (= T_11 (= "" T_10)))
(assert (= T_12 (not T_11)))
(assert T_12)
(assert (= T_13 (str.++ T1_28 T2_28)))
(assert (= T2_28 var_0xINPUT_14928))
(assert (= T1_28 ""))
(assert (= T_14 (= "" T_13)))
(assert (= T_15 (not T_14)))
(assert T_15)
(assert (= T_16 (str.++ T1_31 T2_31)))
(assert (= T2_31 var_0xINPUT_14928))
(assert (= T1_31 ""))
(assert (= T_17 (= "" T_16)))
(assert T_17)
(check-sat)
