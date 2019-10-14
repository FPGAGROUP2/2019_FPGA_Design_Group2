# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "state_1" -parent ${Page_0}
  ipgui::add_param $IPINST -name "state_2" -parent ${Page_0}
  ipgui::add_param $IPINST -name "state_3" -parent ${Page_0}
  ipgui::add_param $IPINST -name "state_4" -parent ${Page_0}
  ipgui::add_param $IPINST -name "state_5" -parent ${Page_0}
  ipgui::add_param $IPINST -name "state_6" -parent ${Page_0}
  ipgui::add_param $IPINST -name "state_7" -parent ${Page_0}


}

proc update_PARAM_VALUE.state_1 { PARAM_VALUE.state_1 } {
	# Procedure called to update state_1 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.state_1 { PARAM_VALUE.state_1 } {
	# Procedure called to validate state_1
	return true
}

proc update_PARAM_VALUE.state_2 { PARAM_VALUE.state_2 } {
	# Procedure called to update state_2 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.state_2 { PARAM_VALUE.state_2 } {
	# Procedure called to validate state_2
	return true
}

proc update_PARAM_VALUE.state_3 { PARAM_VALUE.state_3 } {
	# Procedure called to update state_3 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.state_3 { PARAM_VALUE.state_3 } {
	# Procedure called to validate state_3
	return true
}

proc update_PARAM_VALUE.state_4 { PARAM_VALUE.state_4 } {
	# Procedure called to update state_4 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.state_4 { PARAM_VALUE.state_4 } {
	# Procedure called to validate state_4
	return true
}

proc update_PARAM_VALUE.state_5 { PARAM_VALUE.state_5 } {
	# Procedure called to update state_5 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.state_5 { PARAM_VALUE.state_5 } {
	# Procedure called to validate state_5
	return true
}

proc update_PARAM_VALUE.state_6 { PARAM_VALUE.state_6 } {
	# Procedure called to update state_6 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.state_6 { PARAM_VALUE.state_6 } {
	# Procedure called to validate state_6
	return true
}

proc update_PARAM_VALUE.state_7 { PARAM_VALUE.state_7 } {
	# Procedure called to update state_7 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.state_7 { PARAM_VALUE.state_7 } {
	# Procedure called to validate state_7
	return true
}


proc update_MODELPARAM_VALUE.state_1 { MODELPARAM_VALUE.state_1 PARAM_VALUE.state_1 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.state_1}] ${MODELPARAM_VALUE.state_1}
}

proc update_MODELPARAM_VALUE.state_2 { MODELPARAM_VALUE.state_2 PARAM_VALUE.state_2 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.state_2}] ${MODELPARAM_VALUE.state_2}
}

proc update_MODELPARAM_VALUE.state_3 { MODELPARAM_VALUE.state_3 PARAM_VALUE.state_3 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.state_3}] ${MODELPARAM_VALUE.state_3}
}

proc update_MODELPARAM_VALUE.state_4 { MODELPARAM_VALUE.state_4 PARAM_VALUE.state_4 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.state_4}] ${MODELPARAM_VALUE.state_4}
}

proc update_MODELPARAM_VALUE.state_5 { MODELPARAM_VALUE.state_5 PARAM_VALUE.state_5 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.state_5}] ${MODELPARAM_VALUE.state_5}
}

proc update_MODELPARAM_VALUE.state_6 { MODELPARAM_VALUE.state_6 PARAM_VALUE.state_6 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.state_6}] ${MODELPARAM_VALUE.state_6}
}

proc update_MODELPARAM_VALUE.state_7 { MODELPARAM_VALUE.state_7 PARAM_VALUE.state_7 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.state_7}] ${MODELPARAM_VALUE.state_7}
}

