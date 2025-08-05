<?php

namespace App\Http\Controllers;

use App\Models\BankStatement;
use App\Models\Merchant;
use App\Helpers\FundingHelper;
use App\Http\Resources\BankStatementResource;
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
                'file' => 'required|file|mimes:pdf,csv|max:10240', // 10MB max
                'month' => 'required|integer|min:1|max:12',
                'year' => 'required|integer|min:2020|max:' . (date('Y') + 1)
            ]);

            if ($validator->fails()) {
                return FundingHelper::respondError($validator->errors(), 'Validation failed');
            }

            $uploadedFiles = [];

            $file = $request->file('file');

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
                'status' => BankStatement::STATUS_UPLOADED
            ]);


            $uploadedFiles= new BankStatementResource($bankStatement);

            return FundingHelper::respondSuccess($uploadedFiles, 'Bank statements uploaded successfully');
        } catch (\Exception $e) {
            return FundingHelper::respondError([], 'Failed to upload bank statements');

        }
    }
}
