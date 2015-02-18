<!-- Start the Loop. -->
<?php if (have_posts()) : while (have_posts()) : the_post(); ?>          
        <!--post start-->
        <h1 class="post_title"><a href="<?php the_permalink() ?>" rel="bookmark" title="Permanent Link to <?php the_title_attribute(); ?>"><?php the_title(); ?></a></h1>
        <div id="post-<?php the_ID(); ?>" <?php post_class('blog'); ?>>		 
            <div class="post_content">
                <ul class="post_meta blog">
                    <li class="post_date">&nbsp;&nbsp;
                        <?php
                        $archive_year = get_the_time('Y');
                        $archive_month = get_the_time('m');
                        $archive_day = get_the_time('d');
                        ?>
                        <a href="<?php echo get_day_link($archive_year,
                        $archive_month,
                        $archive_day); ?>"><?php echo get_the_time('M, d, Y') ?></a></li>
                    <li class="posted_by">by&nbsp;<span><?php the_author_posts_link(); ?></span></a></li>
                    <li class="post_category"><?php the_category(', '); ?></li>
                    <li class="post_comment"><span><?php
                            comments_popup_link('No Comments.',
                                    '1 Comment.',
                                    '% Comments.');
                            ?></li>
                </ul>           
                <?php if (has_post_thumbnail()) { ?>
                    <?php
                    get_post_thumbnail_id();
                    ?>
                <?php } else { ?>
                    <?php
                    salejunction_get_image();
                    ?>
            <?php } ?>	
                <?php the_excerpt(); ?>
                <a class="read_more" href="<?php the_permalink() ?>"><?php echo CONTINUE_READING_DOTS; ?></a> </div>
            <div class="clear"></div>
                <?php if (has_tag()) { ?>
                <div class="tag">
                    <?php
                    the_tags('Post Tagged with ',
                            ', ',
                            '');
                    ?>
                </div>
        <?php } ?>
        </div>
        <!--End Post-->
        <?php
    endwhile;
else:
    ?>
    <div class="post">
        <p>
    <?php echo SORRY_NO_POST_MATCHED; ?>
        </p>

    </div>
<?php endif; ?>
<!--End Loop-->