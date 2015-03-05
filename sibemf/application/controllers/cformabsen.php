<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class cformabsen extends CI_Controller
{
	function __construct()
	{

		parent::__construct();
		$this->load->library('session');
        $this->load->helper('form');
        $this->load->helper('url');
		$this->load->model('mformabsen');
	}
	public function index()
	{
		$data['hasil'] = $this->mformabsen->nama_staff();
		$this->load->view('welcome_message',$data);  
	}



	function ambil_data_form()
	{
		$namarapat	= $this->input->post('nama_rapat'); //input nim
  		$tanggalrapat 	= $this->input->post('tanggal_rapat'); //input nama
  		$tempatrapat 		= $this->input->post('tempat_rapat'); //input alamat
  		$jumlah = $this->input->post('jumlah');
  		//echo $namarapat;
  		
  		$data1 = array (
  			'Nama' 	=> $namarapat, 
  			'Tanggal'  => $tanggalrapat,
  			'Tempat' => $tempatrapat,
  			'ID_Departemen' => '1'
  		);
  		$this->load->model('mformabsen');
  		for($i=0 ; $i<$jumlah ; $i++){
  			$absen= $this->input->post('absen'.$i);
  			$staff= $this->input->post('id_staff'.$i);
  			echo $absen;
  			echo '<br>'; 
  			echo $staff;
  			echo '<br>';
  			$data_1 = array (
  				'ID_Rapat' => '1',
  				'ID_Staff'=> $staff,
  				'keterangan' => $absen
  			);
  			$this->mformabsen->tambah2($data_1);
  		}
  	
  		
		// $this->mformabsen->tambah($data1);

		//redirect('cformulir');
	}
}
