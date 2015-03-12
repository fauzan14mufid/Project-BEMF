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
        $iddept = $_SESSION['departemen'];
        $id_rp = $this->Rapat->getLastIDRapat();
        $idrapat = '';
        if(intval($id_rp)<10){
            $idrapat = $id_dept.'00'.$id_rp;
        }
        elseif(intval($id_rp)<100 && intval($id_rp)>=10){
            $idrapat = $id_dept.'0'.$id_rp;
        }
        elseif(intval($id_rp)>=100){
            $idrapat = $id_dept.''.$id_rp;
        }
        $jumlah = $this->input->post('jumlah');
        for($i=0 ; $i<$jumlah ; $i++){
            $nilai[$i]= $this->input->post('nilai'.$i);
            $staff[$i]= $this->input->post('id_staff'.$i);
            $data_nilai[$i] = array (
                'id_rapat' => $idrapat,
                'id_staff'=> $staff[$i],
                'keterangan' => $nilai[$i]
            );

           $this->penilaian->setNilai($data_nilai[$i]);
        }
    }
}

?>