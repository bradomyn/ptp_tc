 a PDelayResp message*/
 1817 void issuePDelayResp(TimeInternal *time,Msg

/*  
 * store timestamp for each msg
 */
 wr_timestamp_t synch_tx_ts;     // t1 M
 wr_timestamp_t delayReq_tx_ts;  // t3 S (E2E)
 wr_timestamp_t pDelayReq_tx_ts; // t3 S (P2P)
 wr_timestamp_t pDelayResp_tx_ts;// t5 M (P2P)


 TimeInternal  sync_receive_time;// t2 S 
                                 // t4 M
                                 // t6 S 

     /*  
      *       * stores current Rx timestamp
      *            */
      wr_timestamp_t current_rx_ts;
      wr_timestamp_t current_tx_ts;

} PtpPortDS;



PACKED struct _wr_timestamp {

  // UTC time value (seconds)
    int64_t utc;

  // Nanoseconds
    int32_t nsec;

  // Phase (in picoseconds), linearized for receive timestamps, zero for send timestamps    int32_t phase; // phase(picoseconds)

    int32_t raw_phase;
    int32_t raw_nsec;
    int32_t raw_ahead;

    // correctness flag: when 0, the timestamp MAY be incorrect (e.g. generated during timebase adjustment)
    int correct;
  //int cntr_ahead;
};


Time stamping
****
*TX*
****
netSendEvent -> ptpd_netif_sendto -> poll_tx_timestamp

ptp-noposix/libptpnetif/ptpd_netif.c (ptpd_netif_sendto)
Line 357

