(declare-fun I0_2 () Int)
(declare-fun PCTEMP_LHS_1 () Int)
(declare-fun T0_2 () String)
(declare-fun T1_2 () String)
(declare-fun T2_2 () String)
(declare-fun T3_2 () String)
(declare-fun T4_2 () String)
(declare-fun T5_2 () String)
(declare-fun T_2 () Bool)
(declare-fun T_3 () Bool)
(declare-fun T_SELECT_1 () Bool)
(declare-fun var_0xINPUT_15357 () String)
(assert (= T_SELECT_1 (not (= PCTEMP_LHS_1 (- 1)))))
(assert (ite T_SELECT_1 (and (= PCTEMP_LHS_1 (+ I0_2 0))(= var_0xINPUT_15357 (str.++ T0_2 T1_2))(= I0_2 (str.len T4_2))(= 0 (str.len T0_2))(= T1_2 (str.++ T2_2 T3_2))(= T2_2 (str.++ T4_2 T5_2))(= T5_2 "GoogleAdServingTest=")(not (str.in.re T4_2 (re.++   (str.to.re "G" )  (re.++   (str.to.re "o" ) (re.++  (str.to.re "o" ) (re.++  (str.to.re "g" ) (re.++  (str.to.re "l" ) (re.++  (str.to.re "e" ) (re.++  (str.to.re "A" ) (re.++  (str.to.re "d" ) (re.++  (str.to.re "S" ) (re.++  (str.to.re "e" ) (re.++  (str.to.re "r" ) (re.++  (str.to.re "v" ) (re.++  (str.to.re "i" ) (re.++  (str.to.re "n" ) (re.++  (str.to.re "g" ) (re.++  (str.to.re "T" ) (re.++  (str.to.re "e" ) (re.++  (str.to.re "s" ) (re.++  (str.to.re "t" )  (str.to.re "=" )  ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) ))) (and (= PCTEMP_LHS_1 (- 1))(= var_0xINPUT_15357 (str.++ T0_2 T1_2))(= 0 (str.len T0_2))(not (str.in.re T1_2 (re.++   (str.to.re "G" )  (re.++   (str.to.re "o" ) (re.++  (str.to.re "o" ) (re.++  (str.to.re "g" ) (re.++  (str.to.re "l" ) (re.++  (str.to.re "e" ) (re.++  (str.to.re "A" ) (re.++  (str.to.re "d" ) (re.++  (str.to.re "S" ) (re.++  (str.to.re "e" ) (re.++  (str.to.re "r" ) (re.++  (str.to.re "v" ) (re.++  (str.to.re "i" ) (re.++  (str.to.re "n" ) (re.++  (str.to.re "g" ) (re.++  (str.to.re "T" ) (re.++  (str.to.re "e" ) (re.++  (str.to.re "s" ) (re.++  (str.to.re "t" )  (str.to.re "=" )  ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) )))))
(assert (= T_2 (not (= PCTEMP_LHS_1 (- 1)))))
(assert (= T_3 (not T_2)))
(assert T_3)
(check-sat)
