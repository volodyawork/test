<?php
namespace AppBundle\EventListener;

use Symfony\Component\DependencyInjection\ContainerInterface;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpKernel\Event\GetResponseEvent;

class CountryListener
{

    protected $container;

    public function __construct(ContainerInterface $container)
    {
        $this->container = $container;
    }

    public function onKernelRequest(GetResponseEvent $event)
    {
        $ip = $this->container->get('request_stack')->getCurrentRequest()->server->get('REMOTE_ADDR');
        //$ip = "198.252.206.140";
        $geoip = $this->container->get('maxmind.geoip')->lookup($ip);
        if ($geoip) {
            $countryCode = strtolower($geoip->getCountryCode());
            $site = $this->container->get('request_stack')->getCurrentRequest()->server->get('SERVER_NAME');
            $url = 'http://' . $countryCode . '.' . $site;
            //header('Location: ' . $url);
            $response = new RedirectResponse($url);
            $event->setResponse($response);
        }
        return true;
    }
} 