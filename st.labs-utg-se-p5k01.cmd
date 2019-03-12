#@field IPADDR
#@type STRING
#IP or hostname of the TCP endpoint.
#
#@field PREFIX
#@type STRING
#Prefix for EPICS PVs.

require pace5000,0.0.1
require stream,2.8.8
require asyn,4.33.0

epicsEnvSet("SYSTEM", "SES-PREMP:")
epicsEnvSet("IPADDR", "10.4.0.201")
epicsEnvSet("DEVICE", "Pctrl-PACE5000-01:")
epicsEnvSet("ASYNPORT", "$(SYSTEM)-asyn-port")


#Specifying the TCP endpoint and port name
drvAsynIPPortConfigure("$(ASYNPORT)", "$(IPADDR):5025")

epicsEnvSet("STREAM_PROTOCOL_PATH", "$(pace5000_DB)")

#Load your database defining the EPICS records
#dbLoadRecords(pace5000.db, "P=$(PREFIX), R=:,PORT=$(PREFIX)-asyn-port")
iocshLoad("$(pace5000_DIR)/pace5000.iocsh","SYS=$(SYSTEM), DEV=$(DEVICE), PORT=$(ASYNPORT)")

iocInit()
