<?php

namespace App\Console\Commands;

use App\Actions\ImportLeadsAction;
use App\Jobs\AssignDealsJob;
use Illuminate\Console\Command;

class FundDealsCommand extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'fund:deals';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        app(ImportLeadsAction::class)->execute();

        AssignDealsJob::dispatch()->delay(now()->seconds(5));
    }
}
