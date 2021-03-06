<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInit872181557d12040fab4c5043f7f0ae45
{
    public static $prefixLengthsPsr4 = array (
        'S' => 
        array (
            'Stripe\\' => 7,
        ),
    );

    public static $prefixDirsPsr4 = array (
        'Stripe\\' => 
        array (
            0 => __DIR__ . '/..' . '/stripe/stripe-php/lib',
        ),
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixLengthsPsr4 = ComposerStaticInit872181557d12040fab4c5043f7f0ae45::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInit872181557d12040fab4c5043f7f0ae45::$prefixDirsPsr4;

        }, null, ClassLoader::class);
    }
}
