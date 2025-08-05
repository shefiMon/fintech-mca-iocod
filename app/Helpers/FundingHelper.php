<?php
namespace App\Helpers;
use Illuminate\Http\UploadedFile;
use Mockery\Matcher\Any;

class FundingHelper
{
    public static function calculateFundingRatio(float $requestedAmount, float $totalFunding): float
    {
        if ($totalFunding <= 0) {
            return 0;
        }

        return round(($totalFunding/$requestedAmount ) * 100, 2);
    }

    public static function parseCsv(string $filePath): array
    {
        $data = [];
        $handle = fopen($filePath, 'r');

        if ($handle === false) {
            return $data;
        }

        $header = fgetcsv($handle);

        while (($row = fgetcsv($handle)) !== false) {
            $data[] = array_combine($header, $row);
        }

        fclose($handle);
        return $data;
    }

    public static function storeFile(UploadedFile $file, string $filePath,$fileName): string
    {

        return $file->storeAs($filePath, $fileName, 'public');
    }

    public static function respondSuccess($data, string $message = 'Success'): \Illuminate\Http\JsonResponse
    {
        return response()->json([
            'success' => true,
            'message' => $message,
            'data' => $data
        ]);
    }


    public static function respondError($error, string $message = 'Error', int $statusCode = 422): \Illuminate\Http\JsonResponse
    {
        return response()->json([
            'success' => false,
            'errorMsg' => $message,
            'error' => $error
        ]);
    }
}
