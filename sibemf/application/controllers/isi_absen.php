<?php
/**
 * Created by PhpStorm.
 * User: andre.na70
 * Date: 3/2/2015
 * Time: 10:33 PM
 */

class Isi_Absen extends CI_Controller {
    function __construct()
    {
        parent::__construct();
        $this->load->model('Staff');
        $this->load->model('Departemen');
        $this->load->model('Kehadiran');
        $this->load->model('Rapat');
    }

    public function isi()
    {
        $data['Staff'] = $this->Staff->getAllStaff()->result();
        $this->load->view('rapat_form',$data);
    }

    public function ambil_data_form()
    {
        $id_dept = 1;
        $nama_rapat = $this->input->post('nama_rapat');
        $tgl_rapat = $this->input->post('tanggal_rapat');
        $tempat_rapat = $this->input->post('tempat_rapat');

        $num_rapat = $this->Rapat->getTotalRapatDepartemen($id_dept);
        $id_rapat = '';
        if($num_rapat<10){
            $id_rapat = '01'.'00'.$num_rapat;
        }
        elseif($num_rapat==10 && $num_rapat<100){
            $id_rapat = '01'.'0'.$num_rapat;
        }
        elseif($num_rapat==100 && $num_rapat<=999){
            $id_rapat = '01'.$num_rapat;
        }
        $data1 = array(
            'ID_Rapat' => $id_rapat,
            'Nama' => $nama_rapat,
            'Tanggal' => $tgl_rapat,
            'Tempat' => $tempat_rapat,
            'ID_Departemen' => $id_dept
        );
        $this->Rapat->setDataRapat($data1);
        $staffquery = $this->Staff->getStaffByDeptID($id_dept)->result();
        foreach($staffquery as $row){
            $data2 = array(
                'id_rapat' => $id_rapat,
                'id_staff' => $row->ID_Staff,
                'keterangan' => 1
            );
            $this->Kehadiran->setHadirRapat($data2);
        }
        $this->load->view('rapat_form');
    }
}

?>