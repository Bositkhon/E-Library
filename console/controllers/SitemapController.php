<?php

namespace console\controllers;

use Yii;
use yii\console\Controller;
use yii\helpers\Console;
use yii\helpers\StringHelper;
use samdark\sitemap\Index;
use samdark\sitemap\Sitemap;

class SitemapController extends Controller
{
    public function actionGenerate()
    {
        $webUrl= Yii::getAlias('@frontendUrl');

        // проверка наличия слеша в конце ссылки
        if (!StringHelper::endsWith($webUrl, '/', false)) {
            $webUrl .= '/';
        }

        $webPath = Yii::getAlias('@frontend/web/');

        // create sitemap
        $sitemap = new Sitemap($webPath . 'sitemap.xml');

        // write it
        $sitemap->write();

        // get URLs of sitemaps written
        $sitemapFileUrls = $sitemap->getSitemapUrls($webUrl);

        // create sitemap for static files
        $staticSitemap = new Sitemap($webPath . 'sitemap_static.xml');

        // write it
        $staticSitemap->write();

        // get URLs of sitemaps written
        $staticSitemapUrls = $staticSitemap->getSitemapUrls($webUrl);

        // create sitemap index file
        $index = new Index($webPath . 'sitemap_index.xml');

        // add URLs
        foreach ($sitemapFileUrls as $sitemapUrl) {
            $index->addSitemap($sitemapUrl);
        }

        // add more URLs
        foreach ($staticSitemapUrls as $sitemapUrl) {
            $index->addSitemap($sitemapUrl);
        }

        // write it
        $index->write();

        Console::output('The sitemap generated successfully.');
    }
}
