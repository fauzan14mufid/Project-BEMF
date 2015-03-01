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
		$nama_rapat	= $this->input->post('nama_rapat'); //input nim
  		$tanggal_rapat 	= $this->input->post('tanggal_rapat'); //input nama
  		$tempat_rapat 		= $this->input->post('tempat_rapat'); //input alamat
  		echo $nama_rapat;
  		/*$absen = $this->input->post('absen');*/
  		$data1 = array (
  			'Nama' 	=> $nama_rapat, 
  			'Tanggal'  			=> $tanggal_rapat,
  			'Tempat'	=> $tempat_rapat,
  			'ID_Departemen' => '1'
  		);
  		/*$data2 = array (
  			'keterangan' => $absen,  
  		);*/
  
  		$this->load->model('mformabsen');
		//print_r($data1);
		//print_r($data2);
		//print_r($data3);
		$this->mformabsen->tambah($data1);

		//redirect('cformulir');
	}
}
