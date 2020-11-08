{extends file='parent:_partials/head.tpl'}

{block name='hook_header'}
  {$HOOK_HEADER nofilter}
  {literal}
  <script>
    !function(f,b,e,v,n,t,s)
    {if(f.fbq)return;n=f.fbq=function(){n.callMethod?
    n.callMethod.apply(n,arguments):n.queue.push(arguments)};
    if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';
    n.queue=[];t=b.createElement(e);t.async=!0;
    t.src=v;s=b.getElementsByTagName(e)[0];
    s.parentNode.insertBefore(t,s)}(window, document,'script',
    'https://connect.facebook.net/en_US/fbevents.js');
    fbq('init', '995049557655551');
    fbq('track', 'PageView');
  </script>
  <noscript>
    <img height="1" width="1" style="display:none" 
        src="https://www.facebook.com/tr?id=995049557655551&ev=PageView&noscript=1"/>
  </noscript>
  {/literal}

  {literal}
  <script async src="https://www.googletagmanager.com/gtag/js?id=UA-182282234-1">
  </script>
  <script>
    window.dataLayer = window.dataLayer || [];
    function gtag(){dataLayer.push(arguments);}
    gtag('js', new Date());
    gtag('config', 'UA-182282234-1');
  </script>
  {/literal}
{/block}
