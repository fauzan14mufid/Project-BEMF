<?php

class All_Nilai extends CI_Controller {
    public function __construct()
    {
        parent::__construct();
        $this->load->library('session'); // barangkali perlu, hapus kalo bikin error
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
            $leadership[$i]= $this->input->post('nilai'.$i);
            $teamwork[$i]= $this->input->post('nilai1'.$i);
            $problem_solving[$i] = $this->input->post('nilai2'.$i);
            $loyalitas[$i] = $this->input->post('nilai3'.$i);
            $kinerja[$i] = $this->input->post('nilai4'.$i);
            $attitude[$i] = $this->input->post('nilai5'.$i);
            $total[$i] = ($leadership[$i]+$teamwork[$i]+$problem_solving[$i]+$loyalitas[$i]+$kinerja[$i]+ $attitude[$i])/6;
            $data_nilai[$i] = array (

                'Leadership' => $leadership[$i],
                'Teamwork'=>  $teamwork[$i],
                'Problem_Solving' => $problem_solving[$i],
                'Loyalitas' => $loyalitas[$i],
                'Kinerja' => $kinerja[$i] ,
                'Attitude' => $attitude[$i],
                'Total_Nilai' => $total[$i]
            );

           $this->penilaian->setNilai($data_nilai[$i]);
        }
    }
}

?>