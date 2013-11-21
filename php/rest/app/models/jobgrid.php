<?php
/**
 * @class Jobgrid
 *
 * $params->job_dbid
 * $params->job_customer_dbid 
 * $params->job_deleted_sw
 * $params->job_deleted_dt
 * $params->job_deleted_unique_key
 * $params->job_id
 * $params->job_name
 * $params->job_addr1
 * $params->job_addr2 
 * $params->job_city 
 * $params->job_state
 * $params->job_zip
 * $params->job_phone1
 * $params->job_phone2
 * $params->job_fixed_amt
 * $params->job_totwtm_amt 
 * $params->job_totjtm_amt 
 * $params->job_totwfe_amt 
 * $params->job_totjfe_amt 
 * $params->job_tot50tm_amt 
 * $params->job_tot50fe_amt 
 */

class Jobgrid extends Model {


    static function view($id, $params) {

        global $db;

        $results = array();

        $sql = "SELECT ".
            'job_dbid,'.
            'job_deleted_sw,'.
            'job_deleted_dt,'.
            'job_id,'.
            'job_name,'.
            'job_addr1,'.
            'job_addr2,'.
            'job_city,'.
            'job_state,'. 
            'job_zip,'.
            'job_phone1,'.
            'job_phone2,'.            
            'job_fixed_amt,'. 
            'job_totwtm_amt,'. 
            'job_totjtm_amt,'. 
            'job_totwfe_amt,'. 
            'job_totjfe_amt,'.
            'job_frequency_id,'.
            'customer_id,'.
            'customer_deleted_sw,'.
            'customer_deleted_dt,'.
            'customer_name,'.
            'customer_addr1,'.
            'customer_addr2,'.
            'customer_city,'.
            'customer_state,'.
            'customer_zip,'.
            'customer_phone1,'.
            'customer_phone2,'.
            'view_last_invoice_dt'.
            ' FROM job_grid_view';

        if (isset($id)) {
            $id_components = explode ( '::' , $id );
            if ($id_components[0]=='DBID') {
                $sql = $sql." WHERE job_dbid =".$id_components[1];
            } else if ($id_components[0]=='CUSTOMER_DBID') {
                $sql = $sql." WHERE customer_dbid =".$id_components[1]." AND NOT job_deleted_sw ORDER BY job_id";
            } else if ($id=='SHOW::DELETED') {
                $sql = $sql." WHERE job_deleted_sw ORDER BY job_deleted_dt DESC";
            } else if ($id=='SHOW::ACTIVE') {
                $sql = $sql." WHERE NOT job_deleted_sw ORDER BY customer_id,job_id";
            } else if ($id=='SHOW::ALL') {
                // No WHERE clause required
            } else {
                $id_components = explode ( 'SEARCH::' , $id );
                if (isset($id_components[1])) {
                    $sql = $sql." WHERE NOT job_deleted_sw AND customer_name like '%".$id_components[1]."%';";
                } else {
                    $sql = $sql." WHERE customer_id ='".$id_components[0]."'";
                }
            }
        }

        foreach ($db->query($sql, PDO::FETCH_ASSOC) as $row) {

            $gridArray = array();
                         
            $gridArray['customer_id'] = $row['customer_id'];
            $gridArray['job_id'] = $row['job_id'];
            $gridArray['job_dbid'] = $row['job_dbid'];
            $gridArray['job_deleted_sw'] = $row['job_deleted_sw'];
            $gridArray['job_deleted_dt'] = $row['job_deleted_dt'];
            $gridArray['job_phone1'] = $row['job_phone1'];
            $gridArray['job_frequency_id'] = $row['job_frequency_id'];
            $gridArray['view_last_invoice_dt'] = $row['view_last_invoice_dt'];

            $fullAddress = '';

            $value = trim($row['customer_name']);
            if ($value != null && $value !='' ) {
                $fullAddress = $value;
            }

            $value = trim($row['customer_addr1']);
            if ($value != null && $value !='' ) {
                if ($fullAddress != null && $fullAddress !='' ) {
                    $fullAddress = $fullAddress . '<br>';
                }
                $fullAddress = $fullAddress . $value;
            }

            $value = trim($row['customer_addr2']);
            if ($value != null && $value !='' ) {
                if ($fullAddress != null && $fullAddress !='' ) {
                    $fullAddress = $fullAddress . '<br>';
                }
                $fullAddress = $fullAddress . $value;
            }

            $cityStateZip = '';
            $value = trim($row['customer_city']);
            if ($value != null && $value !='' ) {
                $cityStateZip = $cityStateZip . $value . ' ';
            }
            $value = trim($row['customer_state']);
            if ($value != null && $value !='' ) {
                $cityStateZip = $cityStateZip . $value . ', ';
            }
            $value = trim($row['customer_zip']);
            if ($value != null && $value !='' ) {
                $cityStateZip = $cityStateZip . $value ;
            }

            if ($cityStateZip != null && $cityStateZip !='' ) {
                if ($fullAddress != null && $fullAddress !='' ) {
                    $fullAddress = $fullAddress . '<br>';
                }
                $fullAddress = $fullAddress . $cityStateZip;
            }

            $gridArray['grid_bill_to_addr'] = $fullAddress;

            $fullAddress = '';

            $value = trim($row['job_name']);
            if ($value != null && $value !='' ) {
                $fullAddress = $value;
            }

            $value = trim($row['job_addr1']);
            if ($value != null && $value !='' ) {
                if ($fullAddress != null && $fullAddress !='' ) {
                    $fullAddress = $fullAddress . '<br>';
                }
                $fullAddress = $fullAddress . $value;
            }

            $value = trim($row['job_addr2']);
            if ($value != null && $value !='' ) {
                if ($fullAddress != null && $fullAddress !='' ) {
                    $fullAddress = $fullAddress . '<br>';
                }
                $fullAddress = $fullAddress . $value;
            }

            $cityStateZip = '';
            $value = trim($row['job_city']);
            if ($value != null && $value !='' ) {
                $cityStateZip = $cityStateZip . $value . ' ';
            }
            $value = trim($row['job_state']);
            if ($value != null && $value !='' ) {
                $cityStateZip = $cityStateZip . $value . ', ';
            }
            $value = trim($row['job_zip']);
            if ($value != null && $value !='' ) {
                $cityStateZip = $cityStateZip . $value ;
            }

            if ($cityStateZip != null && $cityStateZip !='' ) {
                if ($fullAddress != null && $fullAddress !='' ) {
                    $fullAddress = $fullAddress . '<br>';
                }
                $fullAddress = $fullAddress . $cityStateZip;
            }
            $gridArray['grid_job_addr'] = $fullAddress;

            $fullPrices = '';
            $value = $row['job_fixed_amt'];
            if ($value!=0) {
                if ($fullPrices != null && $fullPrices !='' ) {
                    $fullPrices = $fullPrices . '<br>';
                }
                $fullPrices = $fullPrices . 'Job Fixed Amount:<br>$' . $value;
            }

            $value = $row['job_totwfe_amt'];
            if ($value!=0) {
                if ($fullPrices != null && $fullPrices !='' ) {
                    $fullPrices = $fullPrices . '<br>';
                }
                $fullPrices = $fullPrices . 'Windows:<br>$' . $value;
                $value = $row['job_totwtm_amt'];
                if ($value!=0) {
                    $fullPrices = $fullPrices . ' - (' . $value. ' minutes)';
                }
            }

            $value = $row['job_totjfe_amt'];
            if ($value!=0) {
                if ($fullPrices != null && $fullPrices !='' ) {
                    $fullPrices = $fullPrices . '<br>';
                }
                $fullPrices = $fullPrices . 'Janitorial:<br>$' . $value;

                $value = $row['job_totjtm_amt'];
                if ($value!=0) {
                    $fullPrices = $fullPrices . ' - (' . $value. ' minutes)';
                }
            }


            $gridArray['grid_prices'] = $fullPrices;

            array_push($results, $gridArray);
        }

        return $results;
    }


    static function destroy($id, $params) {

    	global $db;

        $dbid = $params->job_dbid;

        $statement = $db->prepare('UPDATE job SET job_deleted_sw = NOT(job_deleted_sw) WHERE job_dbid = :job_dbid');
        $statement->execute( array(':job_dbid' => $dbid) );

        return Jobgrid::view('DBID::'.$dbid, $params);
    }
}
