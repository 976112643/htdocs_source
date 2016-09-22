<?php
namespace Backend\Controller\Base;
use Backend\Controller\Base\AdminController;
use Common\Org\UploadFile;
class ExcelController extends AdminController {
	/**方法**/
	public function  index(){
        $this->display();
    }
	public function exportExcel($expTitle,$expCellName,$expTableData){
			$xlsTitle = iconv('utf-8', 'gb2312', $expTitle);//文件名称
			$fileName = $_SESSION['account'].date('_YmdHis');//or $xlsTitle 文件名称可根据自己情况设定
			$cellNum = count($expCellName);
			$dataNum = count($expTableData);
			vendor("PHPExcel.PHPExcel");
		   
			$objPHPExcel = new PHPExcel();
			$cellName = array('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','AA','AB','AC','AD','AE','AF','AG','AH','AI','AJ','AK','AL','AM','AN','AO','AP','AQ','AR','AS','AT','AU','AV','AW','AX','AY','AZ');
			
			$objPHPExcel->getActiveSheet(0)->mergeCells('A1:'.$cellName[$cellNum-1].'1');//合并单元格
		   // $objPHPExcel->setActiveSheetIndex(0)->setCellValue('A1', $expTitle.'  Export time:'.date('Y-m-d H:i:s'));  
			for($i=0;$i<$cellNum;$i++){
				$objPHPExcel->setActiveSheetIndex(0)->setCellValue($cellName[$i].'2', $expCellName[$i][1]); 
			} 
			  // Miscellaneous glyphs, UTF-8   
			for($i=0;$i<$dataNum;$i++){
			  for($j=0;$j<$cellNum;$j++){
				$objPHPExcel->getActiveSheet(0)->setCellValue($cellName[$j].($i+3), $expTableData[$i][$expCellName[$j][0]]);
			  }             
			}  
			
			header('pragma:public');
			header('Content-type:application/vnd.ms-excel;charset=utf-8;name="'.$xlsTitle.'.xls"');
			header("Content-Disposition:attachment;filename=$fileName.xls");//attachment新窗口打印inline本窗口打印
			$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');  
			$objWriter->save('php://output'); 
			exit;   
		}
	/**
     *
     * 导出Excel
     */
    public function expUser(){//导出Excel
        $xlsName  = "User";
        $xlsCell  = array(
			array('id','账号序列'),
			array('truename','名字'),
			array('sex','性别'),
			array('res_id','院系'),
			array('sp_id','专业'),
			array('class','班级'),
			array('year','毕业时间'),
			array('city','所在地'),
			array('company','单位'),
			array('zhicheng','职称'),
			array('zhiwu','职务'),
			array('jibie','级别'),
			array('tel','电话'),
			array('qq','qq'),
			array('email','邮箱'),
			array('honor','荣誉'),
			array('remark','备注')    
        );
        $xlsModel = M('Member');
    
        $xlsData  = $xlsModel->Field('id,truename,sex,res_id,sp_id,class,year,city,company,zhicheng,zhiwu,jibie,tel,qq,email,honor,remark')->select();
        foreach ($xlsData as $k => $v)
        {
            $xlsData[$k]['sex']=$v['sex']==1?'男':'女';
        }
        $this->exportExcel($xlsName,$xlsCell,$xlsData);
         
    }
	function impUser(){

		if (!empty($_FILES)) {
			
			$config=array(
                'allowExts'=>array('xlsx','xls'),
                'savePath'=>'./Public/upload/',
                'saveRule'=>'time',
			);
			$upload = new UploadFile($config);
			
			if (!$upload->upload()) {
				
				$this->error($upload->getErrorMsg());
			} else {
				$info = $upload->getUploadFileInfo();
			}


			vendor("PHPExcel.PHPExcel");
			$file_name=$info[0]['savepath'].$info[0]['savename'];
			
			$objReader = PHPExcel_IOFactory::createReader('Excel2007');
			$objPHPExcel = $objReader->load($file_name,$encode='utf-8');
			$sheet = $objPHPExcel->getSheet(0);
			$highestRow = $sheet->getHighestRow(); // 取得总行数
			$highestColumn = $sheet->getHighestColumn(); // 取得总列数

			for($i=3;$i<=$highestRow;$i++)
			{
				$data['imsi']= $objPHPExcel->getActiveSheet()->getCell("C".$i,PHPExcel_Style_NumberFormat::FORMAT_TEXT)->getValue();
				$data['mobile'] = $objPHPExcel->getActiveSheet()->getCell("B".$i)->getValue();
				$data['vins_no'] = $objPHPExcel->getActiveSheet()->getCell("A".$i)->getValue();
				
				M('Shebei')->add($data);
			}
			// M('Wear')->add($data);
			$this->success('导入成功！');
		}else
		{
			$this->error("请选择上传的文件");
		}
			

	}
	
}