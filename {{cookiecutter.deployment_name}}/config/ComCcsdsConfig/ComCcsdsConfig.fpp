module ComCcsdsConfig {
    #Base ID for the ComCcsds Subtopology, all components are offsets from this base ID
    constant BASE_ID = 0x02000000
    
    module QueueSizes {
        constant comQueue    = 3
        constant aggregator  = 3
    }

    module StackSizes {
        constant comQueue   = 64 * 1024
        constant aggregator = 64 * 1024
    }

    module Priorities {
        constant comQueue   = 101
    }

    # Svc/Subtopologies/ComCcsds/ComCcsds.fpp requires
    # QueueSizes.aggregator/StackSizes.aggregator unconditionally
    # (fpp-to-cpp: "symbol aggregator is not defined" otherwise) - confirmed
    # against F' v4.1.1 and v4.3.0. At neither version does the aggregator
    # instance take a `priority` or `cpu` clause, so no CpuAffinities module
    # or aggregator priority is needed here.

    # Queue configuration constants
    module QueueDepths {
        constant events      = 10             
        constant tlm         = 25            
        constant file        = 1            
    }

    module QueuePriorities {
        constant events      = 0                 
        constant tlm         = 2                 
        constant file        = 1                   
    }

    # Buffer management constants
    module BuffMgr {
        constant frameAccumulatorSize  = 2048     
        constant commsBuffSize         = 140      
        constant commsFileBuffSize     = 140      
        constant commsBuffCount        = 3        
        constant commsFileBuffCount    = 3       
        constant commsBuffMgrId        = 200      
    }
}
