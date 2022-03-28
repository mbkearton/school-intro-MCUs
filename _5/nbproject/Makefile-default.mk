#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/_5.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/_5.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=source/app_clock.c source/app_heartbeat.S source/app_test_keypad.c source/config_bits.S source/data.S source/hardware.S source/keypad.S source/lcd.S source/main.S source/svc_keypad.c source/isr_timer1.S source/isr_timer32.S source/app_test_timer32.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/source/app_clock.o ${OBJECTDIR}/source/app_heartbeat.o ${OBJECTDIR}/source/app_test_keypad.o ${OBJECTDIR}/source/config_bits.o ${OBJECTDIR}/source/data.o ${OBJECTDIR}/source/hardware.o ${OBJECTDIR}/source/keypad.o ${OBJECTDIR}/source/lcd.o ${OBJECTDIR}/source/main.o ${OBJECTDIR}/source/svc_keypad.o ${OBJECTDIR}/source/isr_timer1.o ${OBJECTDIR}/source/isr_timer32.o ${OBJECTDIR}/source/app_test_timer32.o
POSSIBLE_DEPFILES=${OBJECTDIR}/source/app_clock.o.d ${OBJECTDIR}/source/app_heartbeat.o.d ${OBJECTDIR}/source/app_test_keypad.o.d ${OBJECTDIR}/source/config_bits.o.d ${OBJECTDIR}/source/data.o.d ${OBJECTDIR}/source/hardware.o.d ${OBJECTDIR}/source/keypad.o.d ${OBJECTDIR}/source/lcd.o.d ${OBJECTDIR}/source/main.o.d ${OBJECTDIR}/source/svc_keypad.o.d ${OBJECTDIR}/source/isr_timer1.o.d ${OBJECTDIR}/source/isr_timer32.o.d ${OBJECTDIR}/source/app_test_timer32.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/source/app_clock.o ${OBJECTDIR}/source/app_heartbeat.o ${OBJECTDIR}/source/app_test_keypad.o ${OBJECTDIR}/source/config_bits.o ${OBJECTDIR}/source/data.o ${OBJECTDIR}/source/hardware.o ${OBJECTDIR}/source/keypad.o ${OBJECTDIR}/source/lcd.o ${OBJECTDIR}/source/main.o ${OBJECTDIR}/source/svc_keypad.o ${OBJECTDIR}/source/isr_timer1.o ${OBJECTDIR}/source/isr_timer32.o ${OBJECTDIR}/source/app_test_timer32.o

# Source Files
SOURCEFILES=source/app_clock.c source/app_heartbeat.S source/app_test_keypad.c source/config_bits.S source/data.S source/hardware.S source/keypad.S source/lcd.S source/main.S source/svc_keypad.c source/isr_timer1.S source/isr_timer32.S source/app_test_timer32.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/_5.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MX460F512L
MP_LINKER_FILE_OPTION=
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/source/app_heartbeat.o: source/app_heartbeat.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/source" 
	@${RM} ${OBJECTDIR}/source/app_heartbeat.o.d 
	@${RM} ${OBJECTDIR}/source/app_heartbeat.o 
	@${RM} ${OBJECTDIR}/source/app_heartbeat.o.ok ${OBJECTDIR}/source/app_heartbeat.o.err 
	${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1 -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/source/app_heartbeat.o.d"  -o ${OBJECTDIR}/source/app_heartbeat.o source/app_heartbeat.S  -DXPRJ_default=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/source/app_heartbeat.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_ICD4=1 -mdfp="${DFP_DIR}"
	@${FIXDEPS} "${OBJECTDIR}/source/app_heartbeat.o.d" "${OBJECTDIR}/source/app_heartbeat.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/source/config_bits.o: source/config_bits.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/source" 
	@${RM} ${OBJECTDIR}/source/config_bits.o.d 
	@${RM} ${OBJECTDIR}/source/config_bits.o 
	@${RM} ${OBJECTDIR}/source/config_bits.o.ok ${OBJECTDIR}/source/config_bits.o.err 
	${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1 -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/source/config_bits.o.d"  -o ${OBJECTDIR}/source/config_bits.o source/config_bits.S  -DXPRJ_default=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/source/config_bits.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_ICD4=1 -mdfp="${DFP_DIR}"
	@${FIXDEPS} "${OBJECTDIR}/source/config_bits.o.d" "${OBJECTDIR}/source/config_bits.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/source/data.o: source/data.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/source" 
	@${RM} ${OBJECTDIR}/source/data.o.d 
	@${RM} ${OBJECTDIR}/source/data.o 
	@${RM} ${OBJECTDIR}/source/data.o.ok ${OBJECTDIR}/source/data.o.err 
	${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1 -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/source/data.o.d"  -o ${OBJECTDIR}/source/data.o source/data.S  -DXPRJ_default=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/source/data.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_ICD4=1 -mdfp="${DFP_DIR}"
	@${FIXDEPS} "${OBJECTDIR}/source/data.o.d" "${OBJECTDIR}/source/data.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/source/hardware.o: source/hardware.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/source" 
	@${RM} ${OBJECTDIR}/source/hardware.o.d 
	@${RM} ${OBJECTDIR}/source/hardware.o 
	@${RM} ${OBJECTDIR}/source/hardware.o.ok ${OBJECTDIR}/source/hardware.o.err 
	${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1 -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/source/hardware.o.d"  -o ${OBJECTDIR}/source/hardware.o source/hardware.S  -DXPRJ_default=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/source/hardware.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_ICD4=1 -mdfp="${DFP_DIR}"
	@${FIXDEPS} "${OBJECTDIR}/source/hardware.o.d" "${OBJECTDIR}/source/hardware.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/source/keypad.o: source/keypad.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/source" 
	@${RM} ${OBJECTDIR}/source/keypad.o.d 
	@${RM} ${OBJECTDIR}/source/keypad.o 
	@${RM} ${OBJECTDIR}/source/keypad.o.ok ${OBJECTDIR}/source/keypad.o.err 
	${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1 -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/source/keypad.o.d"  -o ${OBJECTDIR}/source/keypad.o source/keypad.S  -DXPRJ_default=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/source/keypad.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_ICD4=1 -mdfp="${DFP_DIR}"
	@${FIXDEPS} "${OBJECTDIR}/source/keypad.o.d" "${OBJECTDIR}/source/keypad.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/source/lcd.o: source/lcd.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/source" 
	@${RM} ${OBJECTDIR}/source/lcd.o.d 
	@${RM} ${OBJECTDIR}/source/lcd.o 
	@${RM} ${OBJECTDIR}/source/lcd.o.ok ${OBJECTDIR}/source/lcd.o.err 
	${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1 -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/source/lcd.o.d"  -o ${OBJECTDIR}/source/lcd.o source/lcd.S  -DXPRJ_default=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/source/lcd.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_ICD4=1 -mdfp="${DFP_DIR}"
	@${FIXDEPS} "${OBJECTDIR}/source/lcd.o.d" "${OBJECTDIR}/source/lcd.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/source/main.o: source/main.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/source" 
	@${RM} ${OBJECTDIR}/source/main.o.d 
	@${RM} ${OBJECTDIR}/source/main.o 
	@${RM} ${OBJECTDIR}/source/main.o.ok ${OBJECTDIR}/source/main.o.err 
	${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1 -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/source/main.o.d"  -o ${OBJECTDIR}/source/main.o source/main.S  -DXPRJ_default=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/source/main.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_ICD4=1 -mdfp="${DFP_DIR}"
	@${FIXDEPS} "${OBJECTDIR}/source/main.o.d" "${OBJECTDIR}/source/main.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/source/isr_timer1.o: source/isr_timer1.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/source" 
	@${RM} ${OBJECTDIR}/source/isr_timer1.o.d 
	@${RM} ${OBJECTDIR}/source/isr_timer1.o 
	@${RM} ${OBJECTDIR}/source/isr_timer1.o.ok ${OBJECTDIR}/source/isr_timer1.o.err 
	${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1 -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/source/isr_timer1.o.d"  -o ${OBJECTDIR}/source/isr_timer1.o source/isr_timer1.S  -DXPRJ_default=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/source/isr_timer1.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_ICD4=1 -mdfp="${DFP_DIR}"
	@${FIXDEPS} "${OBJECTDIR}/source/isr_timer1.o.d" "${OBJECTDIR}/source/isr_timer1.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/source/isr_timer32.o: source/isr_timer32.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/source" 
	@${RM} ${OBJECTDIR}/source/isr_timer32.o.d 
	@${RM} ${OBJECTDIR}/source/isr_timer32.o 
	@${RM} ${OBJECTDIR}/source/isr_timer32.o.ok ${OBJECTDIR}/source/isr_timer32.o.err 
	${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1 -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/source/isr_timer32.o.d"  -o ${OBJECTDIR}/source/isr_timer32.o source/isr_timer32.S  -DXPRJ_default=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/source/isr_timer32.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_ICD4=1 -mdfp="${DFP_DIR}"
	@${FIXDEPS} "${OBJECTDIR}/source/isr_timer32.o.d" "${OBJECTDIR}/source/isr_timer32.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../ 
	
else
${OBJECTDIR}/source/app_heartbeat.o: source/app_heartbeat.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/source" 
	@${RM} ${OBJECTDIR}/source/app_heartbeat.o.d 
	@${RM} ${OBJECTDIR}/source/app_heartbeat.o 
	@${RM} ${OBJECTDIR}/source/app_heartbeat.o.ok ${OBJECTDIR}/source/app_heartbeat.o.err 
	${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/source/app_heartbeat.o.d"  -o ${OBJECTDIR}/source/app_heartbeat.o source/app_heartbeat.S  -DXPRJ_default=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/source/app_heartbeat.o.asm.d" -mdfp="${DFP_DIR}"
	@${FIXDEPS} "${OBJECTDIR}/source/app_heartbeat.o.d" "${OBJECTDIR}/source/app_heartbeat.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/source/config_bits.o: source/config_bits.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/source" 
	@${RM} ${OBJECTDIR}/source/config_bits.o.d 
	@${RM} ${OBJECTDIR}/source/config_bits.o 
	@${RM} ${OBJECTDIR}/source/config_bits.o.ok ${OBJECTDIR}/source/config_bits.o.err 
	${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/source/config_bits.o.d"  -o ${OBJECTDIR}/source/config_bits.o source/config_bits.S  -DXPRJ_default=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/source/config_bits.o.asm.d" -mdfp="${DFP_DIR}"
	@${FIXDEPS} "${OBJECTDIR}/source/config_bits.o.d" "${OBJECTDIR}/source/config_bits.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/source/data.o: source/data.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/source" 
	@${RM} ${OBJECTDIR}/source/data.o.d 
	@${RM} ${OBJECTDIR}/source/data.o 
	@${RM} ${OBJECTDIR}/source/data.o.ok ${OBJECTDIR}/source/data.o.err 
	${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/source/data.o.d"  -o ${OBJECTDIR}/source/data.o source/data.S  -DXPRJ_default=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/source/data.o.asm.d" -mdfp="${DFP_DIR}"
	@${FIXDEPS} "${OBJECTDIR}/source/data.o.d" "${OBJECTDIR}/source/data.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/source/hardware.o: source/hardware.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/source" 
	@${RM} ${OBJECTDIR}/source/hardware.o.d 
	@${RM} ${OBJECTDIR}/source/hardware.o 
	@${RM} ${OBJECTDIR}/source/hardware.o.ok ${OBJECTDIR}/source/hardware.o.err 
	${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/source/hardware.o.d"  -o ${OBJECTDIR}/source/hardware.o source/hardware.S  -DXPRJ_default=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/source/hardware.o.asm.d" -mdfp="${DFP_DIR}"
	@${FIXDEPS} "${OBJECTDIR}/source/hardware.o.d" "${OBJECTDIR}/source/hardware.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/source/keypad.o: source/keypad.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/source" 
	@${RM} ${OBJECTDIR}/source/keypad.o.d 
	@${RM} ${OBJECTDIR}/source/keypad.o 
	@${RM} ${OBJECTDIR}/source/keypad.o.ok ${OBJECTDIR}/source/keypad.o.err 
	${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/source/keypad.o.d"  -o ${OBJECTDIR}/source/keypad.o source/keypad.S  -DXPRJ_default=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/source/keypad.o.asm.d" -mdfp="${DFP_DIR}"
	@${FIXDEPS} "${OBJECTDIR}/source/keypad.o.d" "${OBJECTDIR}/source/keypad.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/source/lcd.o: source/lcd.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/source" 
	@${RM} ${OBJECTDIR}/source/lcd.o.d 
	@${RM} ${OBJECTDIR}/source/lcd.o 
	@${RM} ${OBJECTDIR}/source/lcd.o.ok ${OBJECTDIR}/source/lcd.o.err 
	${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/source/lcd.o.d"  -o ${OBJECTDIR}/source/lcd.o source/lcd.S  -DXPRJ_default=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/source/lcd.o.asm.d" -mdfp="${DFP_DIR}"
	@${FIXDEPS} "${OBJECTDIR}/source/lcd.o.d" "${OBJECTDIR}/source/lcd.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/source/main.o: source/main.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/source" 
	@${RM} ${OBJECTDIR}/source/main.o.d 
	@${RM} ${OBJECTDIR}/source/main.o 
	@${RM} ${OBJECTDIR}/source/main.o.ok ${OBJECTDIR}/source/main.o.err 
	${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/source/main.o.d"  -o ${OBJECTDIR}/source/main.o source/main.S  -DXPRJ_default=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/source/main.o.asm.d" -mdfp="${DFP_DIR}"
	@${FIXDEPS} "${OBJECTDIR}/source/main.o.d" "${OBJECTDIR}/source/main.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/source/isr_timer1.o: source/isr_timer1.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/source" 
	@${RM} ${OBJECTDIR}/source/isr_timer1.o.d 
	@${RM} ${OBJECTDIR}/source/isr_timer1.o 
	@${RM} ${OBJECTDIR}/source/isr_timer1.o.ok ${OBJECTDIR}/source/isr_timer1.o.err 
	${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/source/isr_timer1.o.d"  -o ${OBJECTDIR}/source/isr_timer1.o source/isr_timer1.S  -DXPRJ_default=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/source/isr_timer1.o.asm.d" -mdfp="${DFP_DIR}"
	@${FIXDEPS} "${OBJECTDIR}/source/isr_timer1.o.d" "${OBJECTDIR}/source/isr_timer1.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/source/isr_timer32.o: source/isr_timer32.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/source" 
	@${RM} ${OBJECTDIR}/source/isr_timer32.o.d 
	@${RM} ${OBJECTDIR}/source/isr_timer32.o 
	@${RM} ${OBJECTDIR}/source/isr_timer32.o.ok ${OBJECTDIR}/source/isr_timer32.o.err 
	${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/source/isr_timer32.o.d"  -o ${OBJECTDIR}/source/isr_timer32.o source/isr_timer32.S  -DXPRJ_default=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/source/isr_timer32.o.asm.d" -mdfp="${DFP_DIR}"
	@${FIXDEPS} "${OBJECTDIR}/source/isr_timer32.o.d" "${OBJECTDIR}/source/isr_timer32.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../ 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/source/app_clock.o: source/app_clock.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/source" 
	@${RM} ${OBJECTDIR}/source/app_clock.o.d 
	@${RM} ${OBJECTDIR}/source/app_clock.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/source/app_clock.o.d" -o ${OBJECTDIR}/source/app_clock.o source/app_clock.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/source/app_clock.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/source/app_test_keypad.o: source/app_test_keypad.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/source" 
	@${RM} ${OBJECTDIR}/source/app_test_keypad.o.d 
	@${RM} ${OBJECTDIR}/source/app_test_keypad.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/source/app_test_keypad.o.d" -o ${OBJECTDIR}/source/app_test_keypad.o source/app_test_keypad.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/source/app_test_keypad.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/source/svc_keypad.o: source/svc_keypad.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/source" 
	@${RM} ${OBJECTDIR}/source/svc_keypad.o.d 
	@${RM} ${OBJECTDIR}/source/svc_keypad.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/source/svc_keypad.o.d" -o ${OBJECTDIR}/source/svc_keypad.o source/svc_keypad.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/source/svc_keypad.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/source/app_test_timer32.o: source/app_test_timer32.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/source" 
	@${RM} ${OBJECTDIR}/source/app_test_timer32.o.d 
	@${RM} ${OBJECTDIR}/source/app_test_timer32.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/source/app_test_timer32.o.d" -o ${OBJECTDIR}/source/app_test_timer32.o source/app_test_timer32.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/source/app_test_timer32.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
else
${OBJECTDIR}/source/app_clock.o: source/app_clock.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/source" 
	@${RM} ${OBJECTDIR}/source/app_clock.o.d 
	@${RM} ${OBJECTDIR}/source/app_clock.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/source/app_clock.o.d" -o ${OBJECTDIR}/source/app_clock.o source/app_clock.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/source/app_clock.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/source/app_test_keypad.o: source/app_test_keypad.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/source" 
	@${RM} ${OBJECTDIR}/source/app_test_keypad.o.d 
	@${RM} ${OBJECTDIR}/source/app_test_keypad.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/source/app_test_keypad.o.d" -o ${OBJECTDIR}/source/app_test_keypad.o source/app_test_keypad.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/source/app_test_keypad.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/source/svc_keypad.o: source/svc_keypad.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/source" 
	@${RM} ${OBJECTDIR}/source/svc_keypad.o.d 
	@${RM} ${OBJECTDIR}/source/svc_keypad.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/source/svc_keypad.o.d" -o ${OBJECTDIR}/source/svc_keypad.o source/svc_keypad.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/source/svc_keypad.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/source/app_test_timer32.o: source/app_test_timer32.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/source" 
	@${RM} ${OBJECTDIR}/source/app_test_timer32.o.d 
	@${RM} ${OBJECTDIR}/source/app_test_timer32.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/source/app_test_timer32.o.d" -o ${OBJECTDIR}/source/app_test_timer32.o source/app_test_timer32.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/source/app_test_timer32.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/_5.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g -mdebugger -D__MPLAB_DEBUGGER_ICD4=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/_5.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)   -mreserve=data@0x0:0x1FC -mreserve=boot@0x1FC02000:0x1FC02FEF -mreserve=boot@0x1FC02000:0x1FC024FF  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=__MPLAB_DEBUGGER_ICD4=1,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -mdfp="${DFP_DIR}"
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/_5.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/_5.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -mdfp="${DFP_DIR}"
	${MP_CC_DIR}\\xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/_5.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
