<?php

/* 
class AnimeEntity, eliminate all the blank space and replaced with underscore
 * 
 * @author weininghu
 */

class AnimeEntity{
    public $title;
    public $genre;
    public $rating;
    public $descripstion;
    public $season;
    public $a_status;
    public $start_date;
    public $studio;
    public $num_of_episode;
    public $link;
    
    function __construct($title,$genre,$rating,$description,$season,$status,$start_date,$studio,$num_of_episode,$link){
        $this->title = $title;
        $this->genre = $genre;
        $this->rating = $rating;
        $this ->description = $description;
        $this ->season = $season;
        $this ->a_status = $status;
        $this ->start_date = $start_date;
        $this ->studio = $studio;
        $this ->num_of_episode = $num_of_episode;
        $this ->link = $link;
    }
}

?>

