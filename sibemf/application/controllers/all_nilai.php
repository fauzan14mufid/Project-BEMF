<?php

class All_Nilai extends CI_Controller {
    public function __construct()
    {
        parent::__construct();
        $this->load->model('Staff');
        $this->load->model('Penilaian_Staff');
        $this->load->model('Penilaian');
    }

    public function isi()
    {
        session_start();
        if(!isset($_SESSION['departemen'])){
            redirect('home/login');
        }   
        echo $_SESSION['departemen'];
        $iddepartemen = $_SESSION['departemen'];
        $data['Staff'] = $this->Staff->getStaffByDeptID($iddepartemen)->result();
        $this->load->view('formnilai',$data);
    }

    public function sendpenilaian()
    {
        session_start();
        if(!isset($_SESSION['departemen'])){
            redirect('home/login');
        }
        $namarapat  = $this->input->post('nama_rapat'); //input nim
        $tanggalrapat   = $this->input->post('tanggal_rapat'); //input nama
        $tempatrapat        = $this->input->post('tempat_rapat'); //input alamat
        $data_rapat = array (
            'Nama'  => $namarapat,
            'Tanggal'  => $tanggalrapat,
            'Tempat' => $tempatrapat,
            'ID_Departemen' => $_SESSION['departemen']
        );
        $this->Rapat->setDataRapat($data_rapat);
        $id_rapat = $this->Rapat->getLastIDRapat()->ID_Rapat;
        /*$idrapat = '';
        if(intval($id_rp)<10){
            $idrapat = $id_dept.'00'.$id_rp;
        }
        elseif(intval($id_rp)<100 && intval($id_rp)>=10){
            $idrapat = $id_dept.'0'.$id_rp;
        }
        elseif(intval($id_rp)>=100){
            $idrapat = $id_dept.''.$id_rp;
        }*/
        $jumlah = $this->input->post('jumlah');
        for($i=0 ; $i<$jumlah ; $i++){
            $absen[$i]= $this->input->post('absen'.$i);
            $staff[$i]= $this->input->post('id_staff'.$i);
            $data_kehadiran[$i] = array (
                'id_rapat' => $id_rapat,
                'id_staff'=> $staff[$i],
                'keterangan' => $absen[$i]
            );

            $this->Kehadiran->setKehadiran($data_kehadiran[$i]);
        }
    }
}

?>