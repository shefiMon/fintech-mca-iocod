<?php

namespace App\Http\Controllers;

use App\Models\BankStatement;
use App\Models\Merchant;
use App\Helpers\FundingHelper;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class MerchantController extends Controller
{
     public function uploadBankStatement(Request $request, $merchantId)
    {
        try {
            // Validate merchant exists
            $merchant = Merchant::findOrFail($merchantId);

            // Validate request
            $validator = Validator::make($request->all(), [
                'files' => 'required|array|min:1|max:4',
                'files.*' => 'required|file|mimes:pdf,csv|max:10240', // 10MB max
                'month' => 'required|integer|min:1|max:12',
                'year' => 'required|integer|min:2020|max:' . (date('Y') + 1)
            ]);

            if ($validator->fails()) {
                return response()->json([
                    'success' => false,
                    'errorMsg' => 'Validation failed',
                    'errors' => $validator->errors()
                ], 422);
            }

            $uploadedFiles = [];
            $errors = [];


                foreach ($request->file('files') as $index => $file) {
                    // Additional file validation

                    // Store file
                    $fileName = time() . '_' . $merchantId . '_' . $file->getClientOriginalName();
                    $filePath = FundingHelper::storeFile($file, 'bank-statements', $fileName);

                    // Create bank statement record
                    $bankStatement = BankStatement::create([
                        'merchant_id' => $merchant->id,
                        'file_name' => $file->getClientOriginalName(),
                        'file_path' => $filePath,
                        'file_type' => strtolower($file->getClientOriginalExtension()),
                        'month' => $request->input('month'),
                        'year' => $request->input('year'),
                        'status' => 'uploaded'
                    ]);


                    $uploadedFiles[] = [
                        'id' => $bankStatement->id,
                        'file_name' => $bankStatement->file_name,
                        'file_type' => $bankStatement->file_type,
                        'file_path' => $bankStatement->file_path,
                        'status' => $bankStatement->status,
                        'download_url' =>  asset('storage/' . $bankStatement->file_path),
                    ];
                }


            $response = [
                'status' => 'success',
                'message' => 'Bank statements processed',
                'data' => [
                    'uploaded_files' => $uploadedFiles,
                    'total_uploaded' => count($uploadedFiles)
                ]
            ];

            if (!empty($errors)) {
                $response['warnings'] = $errors;
            }

            return response()->json($response);

        } catch (\Exception $e) {
            return response()->json([
                'status' => 'error',
                'message' => 'Failed to upload bank statements',
                'error' => $e->getMessage()
            ], 500);
        }
    }
}
