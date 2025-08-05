<?php
namespace App\Helpers;
use Illuminate\Http\UploadedFile;

class FundingHelper
{
    public static function calculateFundingRatio(float $requestedAmount, float $monthlyRevenue): float
    {
        if ($monthlyRevenue <= 0) {
            return 0;
        }

        return round(($requestedAmount / $monthlyRevenue) * 100, 2);
    }

    public static function parseCsvBankStatement(string $filePath): array
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

}
