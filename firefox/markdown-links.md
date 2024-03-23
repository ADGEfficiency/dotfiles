No header:

```
javascript:(function(){const e=document.title,t=window.location.href,n=`[${e}](${t})`;navigator.clipboard.writeText(n).then(()=>console.log("Markdown%20header%20link%20copied%20to%20clipboard!")).catch(e=>console.error("Error%20copying%20text:%20",e));})();
```

With markdown header:

```
javascript:(function(){const e=document.title,t=window.location.href,n=`##%20[${e}](${t})`;navigator.clipboard.writeText(n).then(()=>console.log("Markdown%20header%20link%20copied%20to%20clipboard!")).catch(e=>console.error("Error%20copying%20text:%20",e));})();
```
