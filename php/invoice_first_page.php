<?php
//============================================================+
// File name   : example_012.php
// Begin       : 2008-03-04
// Last Update : 2013-05-14
//
// Description : Example 012 for TCPDF class
//               Graphic Functions
//
// Author: Nicola Asuni
//
// (c) Copyright:
//               Nicola Asuni
//               Tecnick.com LTD
//               www.tecnick.com
//               info@tecnick.com
//============================================================+

/**
 * Creates an example PDF TEST document using TCPDF
 * @package com.tecnick.tcpdf
 * @abstract TCPDF - Example: Graphic Functions
 * @author Nicola Asuni
 * @since 2008-03-04
 */

// Include the main TCPDF library (search for installation path).
require_once('tcpdf_min/tcpdf.php');


// create new PDF document
$pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);

// set document information
$pdf->SetCreator(PDF_CREATOR);
$pdf->SetAuthor('Sparkle');
$pdf->SetTitle('Invoice 123456');
$pdf->SetSubject('Invoice');
$pdf->SetKeywords('Invoice 123456');

// disable header and footer
$pdf->setPrintHeader(false);
$pdf->setPrintFooter(false);

// set default monospaced font
$pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

// set margins
$pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);

// set some language-dependent strings (optional)
if (@file_exists(dirname(__FILE__).'/lang/eng.php')) {
	require_once(dirname(__FILE__).'/lang/eng.php');
	$pdf->setLanguageArray($l);
}

// ---------------------------------------------------------

// set font
$pdf->AddFont('helvetica', '' );
$pdf->AddFont('helvetica', 'I');
$pdf->AddFont('helvetica', 'B');
$pdf->SetFont('helvetica', '', 12);

$styleDottedLine  = array('width'=>0.1, 'cap'=>'round', 'join'=>'round', 'dash'=>'3,3');
$styleNormalLine  = array('width'=>0.3, 'cap'=>'round', 'join'=>'round', 'dash'=>0);
//$styleReflectLine = array('width'=>0.1, 'cap'=>'round', 'join'=>'round', 'dash'=>'.5,.5,.3,.3,.6,.6,.2,.2');
$styleReflectLine = array('width'=>0.1, 'cap'=>'round', 'join'=>'round', 'dash'=>0);

$pdf->SetDrawColor(0);
$pdf->SetLineStyle($styleNormalLine);

// add a page
$pdf->AddPage();


// ---------------------------------------------------------
// -- Create the reflective logo
// ---------------------------------------------------------

$logoText = 'Glassmasters Northwest';
$logoX = 10;
$logoY = 5.5;
$logoFontSize = 28;
$pdf->SetFont('helvetica', 'I', $logoFontSize);

// Draw Dark Primary logo
$pdf->SetDrawColor(0);
$pdf->setTextRenderingMode(0.2, false, false);
$pdf->SetXY($logoX,$logoY);
$pdf->Write(0, $logoText, '', false, '', true, 0, false, false, 0);

// Draw Surface line
$pdf->SetDrawColor(180);
$pdf->SetLineStyle($styleReflectLine);
$pdf->Line($logoX+2.3, $logoY+10.2, $logoX+108.4, $logoY+10.2);

// Draw light reflection of Primary logo
$pdf->SetDrawColor(190);
$pdf->SetLineStyle($styleReflectLine);
$pdf->setTextRenderingMode(0.1, false, false);
$pdf->StartTransform();
$pdf->MirrorV($logoY+7.4);
$pdf->SetXY($logoX,0);
$pdf->Write(0, $logoText, '', 0, '', true, 0, false, false, 0);
$pdf->StopTransform();

// ---------------------------------------------------------
// -- Create the Company Address
// ---------------------------------------------------------

$pdf->SetTextColor(0);
$pdf->SetFont('helvetica', 'I', 12);
$pdf->Text(130, 7,  'Glassmasters Northwest, LLC');
$pdf->Text(130, 11, '1005-B NW 132 St.');
$pdf->Text(130, 15, 'Vancouver, WA 98685');
$pdf->Text(130, 19, 'Phone: 360.546.0337');

// ---------------------------------------------------------
// -- Draw the Box around the Company info
// ---------------------------------------------------------

$pdf->SetDrawColor(0);
$pdf->SetLineStyle($styleNormalLine);
$pdf->RoundedRect(5, 5, 205, 21, 3.50, '1111', 'null');


// ---------------------------------------------------------
// -- Create the Customer Data
// ---------------------------------------------------------

$pdf->SetTextColor(0);
$pdf->SetFont('helvetica', '', 12);
$pdf->Text(14, 32, 'Major Coffee Chain');
$pdf->Text(14, 36, 'Attn: Accounts Payable');
$pdf->Text(14, 40, '19223 SE Broadway');
$pdf->Text(14, 44, 'Suite 510');
$pdf->Text(14, 48, 'Portland, OR 97223-9003');

// ---------------------------------------------------------
// -- Create the Invoice Header Data
// ---------------------------------------------------------

$pdf->SetTextColor(0);
$pdf->SetFont('helvetica', 'I', 12);
$pdf->Text(130, 32, 'Invoice:');
$pdf->Text(130, 36, 'Date:');
$pdf->Text(130, 40, 'Desc:');
$pdf->Text(130, 44, 'Cust #:');
$pdf->Text(130, 48, 'PO #:');
$pdf->SetFont('helvetica', 'B', 12);
$pdf->Text(147, 32, '123456');
$pdf->Text(147, 36, '10/21/2013');
$pdf->Text(147, 40, 'Week of 10/20/2013');
$pdf->Text(147, 44, 'vjdes3');
$pdf->Text(147, 48, '123456-12345');

// ---------------------------------------------------------
// -- Draw the Customer Box
// ---------------------------------------------------------

$pdf->SetDrawColor(0);
$pdf->SetLineStyle($styleNormalLine);
$pdf->RoundedRect(5, 27.5, 205, 31.5, 3.50, '1111', 'null');

// ---------------------------------------------------------
// -- Draw the line detail box
// ---------------------------------------------------------

$pdf->SetDrawColor(0);
$pdf->SetLineStyle($styleNormalLine);
$pdf->RoundedRect(5, 60.5, 205, 162.5, 3.50, '1111', 'null');

// ---------------------------------------------------------
// -- Draw the dotted line
// ---------------------------------------------------------
/*
$pdf->SetDrawColor(0);
$pdf->SetLineStyle($styleDottedLine);
$pdf->Line(5, 224, 210, 224);

// ---------------------------------------------------------
// -- Draw the footer data
// ---------------------------------------------------------

$pdf->SetTextColor(0);
$pdf->SetFont('helvetica', 'I', 10);
$pdf->Text(18, 227, 'Please include your invoice number on your check, or return this section with your payment. Thank you!');

// ---------------------------------------------------------
// -- Draw the footer box
// ---------------------------------------------------------

$pdf->SetDrawColor(0);
$pdf->SetLineStyle($styleNormalLine);
$pdf->RoundedRect(5, 225, 205, 45, 3.50, '1111', 'null');
*/
//Close and output PDF document
$pdf->Output('invoice_blank.pdf', 'I');
